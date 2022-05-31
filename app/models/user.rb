class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owner_leads, class_name: 'Lead', foreign_key: "owner_id"
  has_many :closer_leads, class_name: 'Lead', foreign_key: "closer_id"
  has_many :sources
  has_many :creator_activities, class_name: 'Activity', foreign_key: "creator_id"
  has_many :attender_activities, class_name: 'Activity', foreign_key: "attender_id"
  has_many :action_models
  has_many :creator_meetings, class_name: 'Meeting', foreign_key: "creator_id"
  has_many :attendee_meetings, class_name: 'Meeting', foreign_key: "attendee_id"
  has_many :creator_orders, class_name: 'Order', foreign_key: "creator_id"
  has_many :attendee_orders, class_name: 'Order', foreign_key: "attendee_id"
  has_many :losts
  has_many :reads
  has_many :visitor_notifications, class_name: 'Notification', foreign_key: "visitor_id"
  has_many :visited_notifications, class_name: 'Notification', foreign_key: "visited_id"
  has_many :images
  has_many :creator_schedules, class_name: 'Schedule', foreign_key: "creator_id"
  has_many :attender_schedules, class_name: 'Schedule', foreign_key: "attender_id"

  # enum
  enum role: {システム管理者: 1, 運用管理者: 2, マネージャー: 3, 一般: 4}

  with_options presence: true do
    validates :name, length: { maximum: 6 }
    validates :role
  end

  # パスワードチェックを無効
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end