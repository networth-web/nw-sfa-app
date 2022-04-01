class Property < ApplicationRecord

  # アソシエーション
  has_many :orders
  has_many :activities

  # バリデーション
  with_options presence: true do
    validates :name
    validates :price
  end
end