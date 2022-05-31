class Attend < ActiveHash::Base
  self.data = [
    {id: 1, name: '出席'},
    {id: 2, name: '欠席'},
    {id: 3, name: '出席待ち'},
    {id: 4, name: '出席不要'}
  ]

  include ActiveHash::Associations
  has_many :lead_seminars
end