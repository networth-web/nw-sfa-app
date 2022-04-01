class Occupation < ActiveHash::Base
  self.data = [
    {id: 1, name: '職業1'},
    {id: 2, name: '職業2'},
    {id: 3, name: '職業3'},
    {id: 4, name: '職業4'},
    {id: 5, name: '職業5'}
  ]

  # ActiveHash
  include ActiveHash::Associations
  has_many :leads
end