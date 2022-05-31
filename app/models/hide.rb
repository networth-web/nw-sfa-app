class Hide < ApplicationRecord
  belongs_to :lead

  with_options presence: true do
    validates :reason
  end
end
