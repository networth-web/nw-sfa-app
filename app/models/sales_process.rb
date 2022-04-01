class SalesProcess < ApplicationRecord
  
  # アソシエーション
  has_many :leads

  # バリデーション
  with_options presence: true do
    validates :name
    validates :description
  end
end