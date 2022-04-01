class Level < ActiveHash::Base
  self.data = [
    {id: 1, name: '初級'},
    {id: 2, name: '中級'},
    {id: 3, name: '上級'}
  ]

  # ActiveHash
  include ActiveHash::Associations
  has_many :lead_seminars
end