class LeadSeminar < ApplicationRecord
  
  # アソシエーション
  belongs_to :lead
  belongs_to :seminar, optional: true

  # ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :level
  belongs_to :attend
  belongs_to :approval

  # バリデーション
  with_options presence: true do
    validates :attend_id
    validates :approval_id
  end
  
  with_options allow_blank: true do
    validates :level_id, inclusion: { in: Level.first.id..Level.last.id }
    validates :attend_id, inclusion: { in: Attend.first.id..Attend.last.id }
    validates :approval_id, inclusion: { in: Approval.first.id..Approval.last.id }
  end

  validates :disapproval_reason, presence: true, if: Proc.new { |lead_seminar| lead_seminar.approval_id == 2 }

  # バリデーションメソッド
  validate :seminar?

  private

  def seminar?
    return if seminar_id.blank?
    if Seminar.exists?
      seminar_range = Seminar.first.id..Seminar.last.id
      unless seminar_range.include? seminar_id
        errors.add(:seminar, 'はリストにありません')
        return false
      end
    else
      errors.add(:seminar, 'は対象がありません')
      return false
    end
  end
end