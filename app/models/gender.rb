class Gender < ActiveHash::Base

  self.data = [
    { id: 1, name: '男性' },
    { id: 2, name: '女性' }
  ]

  include ActiveHash::Associations
  has_many :leads

end