class Lost < ApplicationRecord
  belongs_to :lead
  belongs_to :user

  with_options presence: true do
    validates :reason
  end

end