class HomeController < ApplicationController
  def top
    # チャート表示用
    @lead_chart = LeadChart.chart # 毎月のリード数
    @source_chart = SourceChart.chart # ソースの分布
    @meeting_chart = MeetingChart.chart # 各ユーザーの商談数
    @order_chart = OrderChart.chart # 各ユーザーの契約数

    today = Date.today.beginning_of_day..Date.today.end_of_day
    
    # 今日追加されたリードの数
    @today_leads = Lead.where(created_at: today)
    # 今日割り当てられたリードの数
    @my_leads = Lead.joins(:notifications).where(notifications: { created_at: today, visited_id: current_user.id, notification_type: [2, 3] })
    @today_seminars = Seminar.where(start_date_time: today) # 今日のセミナー
  end
end