class Property < ApplicationRecord

  # アソシエーション
  has_many :rooms

  # バリデーション
  validates :name, presence: true
end