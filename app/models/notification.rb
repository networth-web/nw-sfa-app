class Notification < ApplicationRecord

  # アソシエーション
  belongs_to :visitor, class_name: 'User', optional: true
  belongs_to :visited, class_name: 'User'
  belongs_to :lead, optional: true

  # enum
  enum notification_type: {新規リード: 1, 担当者変更: 2, クローザー変更: 3}
end