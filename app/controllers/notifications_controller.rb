class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(visited_id: current_user.id).order(created_at: "DESC")
    @notifications.update_all(checked: true)
  end
end
