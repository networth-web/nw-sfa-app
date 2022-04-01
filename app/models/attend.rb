class Attend < ActiveHash::Base
  self.data = [
    {id: 1, name: '出席'},
    {id: 2, name: '不出席'},
    {id: 3, name: '出席待ち'},
    {id: 4, name: '出席不要'}
  ]

  # ActiveHash
  include ActiveHash::Associations
  has_many :lead_seminars
end