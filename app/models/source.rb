class Source < ApplicationRecord
  
  # アソシエーション
  has_many :leads
  belongs_to :user

  # バリデーション
  with_options presence: true do
    validates :name
    validates :description
  end

  validates :approval, inclusion: {in: [true, false], message: 'を選択してください'}
end