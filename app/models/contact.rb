class Contact < ActiveHash::Base
  self.data = [
    { id: 1, name: '電話' },
    { id: 2, name: 'メール' },
    { id: 3, name: 'LINE' }
  ]

  include ActiveHash::Associations
  has_many :leads
end