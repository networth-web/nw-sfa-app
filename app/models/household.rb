class Household < ActiveHash::Base

  self.data = [
    { id: 1, name: 'ๆใ' },
    { id: 2, name: '็กใ' }
  ]

  include ActiveHash::Associations
  has_many :leads

end