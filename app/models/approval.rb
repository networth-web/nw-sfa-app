class Approval < ActiveHash::Base
  self.data = [
    {id: 1, name: '承認'},
    {id: 2, name: '不承認'},
    {id: 3, name: '承認待ち'},
    {id: 4, name: '承認不要'}
  ]

  # ActiveHash
  include ActiveHash::Associations
  has_many :lead_seminars
end