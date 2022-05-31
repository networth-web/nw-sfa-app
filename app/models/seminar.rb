class Seminar < ApplicationRecord
  has_many :lead_seminars

  # enum
  enum format: {来場: 1,オンライン: 2}

  with_options presence: true do
    validates :start_date_time
    validates :end_date_time
    validates :format
    validates :title
    validates :instructor
    validates :description
  end
  
  # バリデーションメソッド
  validate :end_date_time_after?

  private

  def end_date_time_after?
    return if start_date_time.blank? || end_date_time.blank?
    errors.add(:end_date_time, "は開始日時以降にしてください") if end_date_time < start_date_time
  end
end