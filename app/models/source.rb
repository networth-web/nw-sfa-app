class Source < ApplicationRecord
  has_many :leads
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
  end

  validates :approval, inclusion: {in: [true, false], message: 'を選択してください'}
end