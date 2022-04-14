class Lead < ApplicationRecord

  # アソシエーション
  belongs_to :source
  belongs_to :sales_process
  belongs_to :owner, class_name: 'User', optional: true
  belongs_to :closer, class_name: 'User', optional: true

  has_one :lead_seminar, dependent: :destroy
  has_one :lost, dependent: :destroy
  has_one :hide, dependent: :destroy
  has_one :read, dependent: :destroy

  has_many :activities, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # リッチテキスト
  has_rich_text :remark

  # ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :contact
  belongs_to :gender
  belongs_to :prefecture
  belongs_to :household
  belongs_to :occupation

  # バリデーション
  with_options presence: true do
    validates :name
    validates :contact_id
  end

  with_options allow_blank: true do
    validates :contact_id, inclusion: { in: Contact.pluck(:id) }
    validates :gender_id, inclusion: { in: Gender.pluck(:id) }
    validates :prefecture_id, inclusion: { in: Prefecture.pluck(:id) }
    validates :household_id, inclusion: { in: Household.pluck(:id) }
    validates :occupation_id, inclusion: { in: Occupation.pluck(:id) }
  end

  # バリデーションメソッド
  validate :owner?
  validate :closer?

  # スコープ
  scope :not_lost,  -> { left_joins(:lost).where(losts: { lead_id: nil }) }
  scope :not_hide,  -> { left_joins(:hide).where(hides: { lead_id: nil }) }
  scope :include_association,  -> { includes(:owner, :closer, :source, :sales_process, :lost, :read) }
  scope :only_owner,  -> (current_user){ where(owner_id: current_user.id) }
  scope :only_closer,  -> (current_user){ where(closer_id: current_user.id) }
  scope :only_lost_not_hide,  -> { joins(:lost).left_joins(:hide).where(hides: { lead_id: nil }) }

  # OR検索
  def self.or_search(params)
    # params[:q][:name_or_kana_or_phone_or_email_or_address_or_company_cont_any]が無ければ終了
    return false if params[:q].blank? || params[:q][:name_or_kana_or_email_or_address_or_company_cont_any].blank?
    # [:name_or_kana_cont_any]が配列なら終了（ransackのsort_linkは配列でパラメーターが送られるため）
    return false if params[:q][:name_or_kana_or_email_or_address_or_company_cont_any].instance_of?(Array)
    # squish: 行頭行末のスペースの削除、連続したスペースを一つにする
    squished_keywords = params[:q][:name_or_kana_or_email_or_address_or_company_cont_any].squish
    # split: 条件で分割し配列を生成
    params[:q][:name_or_kana_or_email_or_address_or_company_cont_any] = squished_keywords.split(" ")
  end

  # 承認のセット
  def set_approval(lead_seminar)
    if self.source.approval
      lead_seminar.approval_id = 3
    else
      lead_seminar.approval_id = 4
    end
  end

  # 重複
  def duplicates
    return [] if self.email.blank?
    Lead.where(['email LIKE ?', "%#{self.email}%"])
  end

  # 既読
  def read_lead(current_user)
    return false if self.read.present?
    self.create_read(user_id: current_user.id)
  end

  # 変更があれば、担当者とクローザーの変更の通知を作成する
  def user_notification(type, current_user, before_user, after_user)
    # before_userかafter_userが値がなければreturn
    return false if before_user.blank? || after_user.blank?
    # before_userとafter_userの値が同じならreturn
    return false if before_user == after_user
    # 通知作成
    Notification.create(
      notification_type: type,
      lead_id: self.id,
      visitor_id: current_user.id,
      visited_id: after_user
    )
  end

  # 追加されたリードがあれば通知を作成
  def self.lead_notification(current_user, before_count, after_count)
    # 追加されたリードがなければreturn
    return false if before_count == 0
    # before_countとafter_countの人数が同じならreturn
    return false if before_count == after_count
    lead_count = after_count - before_count
    # 管理者、マネージャーに通知
    User.all.each do |user|
      unless user.role == "一般"
        Notification.create(notification_type: 1, lead_count: lead_count, visitor_id: current_user.id, visited_id: user.id)
      end
    end
  end

  private

  # ownerバリデーション
  def owner?
    return if owner_id.blank? # 値がなれければ終了
    # ユーザーのレコードがなければ終了
    unless User.exists?
      errors.add(:owner, 'は対象がありません')
      return false
    end
    # リストに含まれなければエラーを追加
    owner_range = User.first.id..User.last.id
    if owner_range.exclude?(owner_id)
      errors.add(:owner, 'はリストにありません')
      return false
    end
  end

  # closerバリデーション
  def closer?
    return if closer_id.blank?
    if User.exists?
      closer_range = User.first.id..User.last.id
      unless closer_range.include? closer_id
        errors.add(:closer, 'はリストにありません')
        return false
      end
    else
      errors.add(:closer, 'は対象がありません')
      return false
    end
  end
end