class Schedule < ApplicationRecord
  belongs_to :lead
  belongs_to :creator, class_name: 'User'
  belongs_to :attender, class_name: 'User', optional: true

  with_options presence: true do
    validates :title
    validates :description
    validates :schedule_date_time
  end
end