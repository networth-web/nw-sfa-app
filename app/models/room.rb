class Room < ApplicationRecord
  # アソシエーション
  has_many :activities
  belongs_to :property
  
  # バリデーション
  with_options presence: true do
    validates :number
    validates :price
  end
  # 物件と部屋の組み合わせを一意にする
  validates :property_id, uniqueness: { scope: :number }

  def view_name_and_number
    self.property.name + ' (' + self.number.to_s + '号室)'
  end
end
