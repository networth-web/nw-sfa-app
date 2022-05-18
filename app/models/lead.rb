class Lead < ApplicationRecord
  include SendLine

  # （ソース、営業プロセス、担当者、クローザー）
  belongs_to :source
  belongs_to :sales_process
  belongs_to :owner, class_name: 'User', optional: true
  belongs_to :closer, class_name: 'User', optional: true
  # （リードセミナー、失注、非表示、既読）
  has_one :lead_seminar, dependent: :destroy
  has_one :lost, dependent: :destroy
  has_one :hide, dependent: :destroy
  has_one :read, dependent: :destroy
  # （活動、画像、予定、通知）
  has_many :activities, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # メモ
  has_rich_text :remark

  extend ActiveHash::Associations::ActiveRecordExtensions
  # （連絡方法、性別、都道府県、世帯、職業）
  belongs_to :contact
  belongs_to :gender
  belongs_to :prefecture
  belongs_to :household
  belongs_to :occupation

  with_options presence: true do
    # （名前、連絡方法）
    validates :name
    validates :contact_id
  end

  with_options allow_blank: true do
    # ActiveHashのバリデーション
    validates :contact_id, inclusion: { in: Contact.pluck(:id) }
    validates :gender_id, inclusion: { in: Gender.pluck(:id) }
    validates :prefecture_id, inclusion: { in: Prefecture.pluck(:id) }
    validates :household_id, inclusion: { in: Household.pluck(:id) }
    validates :occupation_id, inclusion: { in: Occupation.pluck(:id) }
  end

  # 自作バリデーション
  validate :owner?
  validate :closer?

  scope :not_lost,  -> { left_joins(:lost).where(losts: { lead_id: nil }) }
  scope :not_hide,  -> { left_joins(:hide).where(hides: { lead_id: nil }) }
  scope :include_association,  -> { includes(:owner, :closer, :source, :sales_process, :lost, :read) }
  scope :only_owner,  -> (current_user){ where(owner_id: current_user.id) }
  scope :only_closer,  -> (current_user){ where(closer_id: current_user.id) }
  scope :only_lost_not_hide,  -> { joins(:lost).left_joins(:hide).where(hides: { lead_id: nil }) }

  # -------------------- 独自メソッド --------------------
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

  # CSVインポートの通知を作成（お知らせ、メール、LINE）
  def self.csv_import_notify(current_user, before_count, after_count)
    # 追加されたリードがいなければ処理を終了
    return false if before_count == after_count

    lead_count = after_count - before_count
    notify_type = 1
    
    # マネージャーのみに通知
    User.all.each do |user|
      if user.role == "マネージャー"
        Notification.create(
          notification_type: notify_type,
          lead_count: lead_count,
          visitor_id: current_user.id,
          visited_id: user.id
        )

        # メール（未使用）
        # NoticeMailer.greeting(user, notify_type).deliver_now
      end
    end

    # LINE通知
    Lead.send_line_for_csv_import(lead_count)
  end

  # ユーザー変更に関する通知を作成（お知らせ、メール、LINE）
  def change_user_notify(notify_type, current_user, before_user, after_user)
    # 変更後のユーザーがいない、または変更がない場合処理を終了
    return false if after_user.blank? || before_user == after_user

    # お知らせ
    Notification.create(
      notification_type: notify_type,
      lead_id: self.id,
      visitor_id: current_user.id,
      visited_id: after_user
    )

    # メール（未使用）
    # NoticeMailer.greeting(after_user, notify_type).deliver_now

    # LINE
    Lead.send_line_for_change_user(notify_type, self, after_user)
  end
  # -------------------- ここまで --------------------


  private

  # ownerバリデーション
  def owner?
    # 値がなければ処理を終了
    return if owner_id.blank?
    # ユーザーがいなければエラー
    unless User.exists?
      errors.add(:owner, 'は対象がありません')
      return false
    end
    # ユーザーのリストになければエラー
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