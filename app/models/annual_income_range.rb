class AnnualIncomeRange < ActiveHash::Base
  self.data = [
    {id: 1, name: '年収帯1'},
    {id: 2, name: '年収帯2'},
    {id: 3, name: '年収帯3'},
    {id: 4, name: '年収帯4'},
    {id: 5, name: '年収帯5'}
  ]

  # ActiveHash
  include ActiveHash::Associations
  has_many :leads
end