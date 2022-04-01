class Read < ApplicationRecord
  
  # アソシエーション
  belongs_to :lead
  belongs_to :user
end