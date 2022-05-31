class SalesProcess < ApplicationRecord
  has_many :leads

  with_options presence: true do
    validates :name
    validates :description
  end
end