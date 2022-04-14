class Activity < ApplicationRecord

  # アソシエーション
  belongs_to :lead
  belongs_to :creator, class_name: 'User'
  belongs_to :attender, class_name: 'User', optional: true
  belongs_to :room, optional: true

  # enum
  enum activity_type: { 行動: 1, 商談: 2, 取引: 3 }, _prefix: true
  enum meeting_type: { 面談: 1, 初訪: 2, 再訪: 3, 買い増し: 4, 紹介依頼: 5 }, _prefix: true

  # バリデーション
  with_options presence: true do
    validates :activity_type
    validates :overview
    validates :start_date_time
  end

  validates :action_name, presence: true, if: Proc.new { |activity| activity.activity_type == "行動" }
  validates :meeting_type, presence: true, if: Proc.new { |activity| activity.activity_type == "商談" }
  validates :end_date_time, presence: true, if: Proc.new { |activity| activity.activity_type == "商談" }
  validates :meeting_result, presence: true, if: Proc.new { |activity| activity.activity_type == "商談" }
  validates :room, presence: true, if: Proc.new { |activity| activity.activity_type == "取引" }

  # スコープ
  scope :not_lost,  -> { left_joins(lead: :lost).where(losts: { lead_id: nil }) }
  scope :not_hide,  -> { left_joins(lead: :hide).where(hides: { lead_id: nil }) }
  scope :only_meeting,  -> { where(activity_type: "商談") }
  scope :only_order,  -> { where(activity_type: "取引") }
  scope :only_creator,  -> (current_user){ where( creator_id: current_user.id ) }
  scope :only_attender,  -> (current_user){ where( attender_id: current_user.id ) }

end