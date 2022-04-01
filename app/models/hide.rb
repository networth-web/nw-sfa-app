class Hide < ApplicationRecord
  
  # アソシエーション
  belongs_to :lead

  # バリデーション
  with_options presence: true do
    validates :reason
  end
end
