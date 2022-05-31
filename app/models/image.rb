class Image < ApplicationRecord
  belongs_to :lead
  belongs_to :user

  has_one_attached :image

end
