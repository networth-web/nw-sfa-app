class Image < ApplicationRecord
  
  # アソシエーション
  belongs_to :lead
  belongs_to :user

  # ActiveStorage
  has_one_attached :image

end
