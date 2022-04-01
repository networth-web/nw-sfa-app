class Lost < ApplicationRecord

  # アソシエーション
  belongs_to :lead
  belongs_to :user

  # バリデーション
  with_options presence: true do
    validates :reason
  end

end