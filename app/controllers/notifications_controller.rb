class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(visited_id: current_user.id)
    @notifications.update_all(checked: true)
  end
end
