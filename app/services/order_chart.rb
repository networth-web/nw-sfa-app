class OrderChart
  def self.chart
    # 過去半年の1日の配列を作成
    last_day = Date.today.change(day: 1) # 今月1日
    first_day = Date.today - 6.months # 半年前
    months = (first_day..last_day).select{|d|d.day == 1}

    # 月表示データ
    months_data = months.map {|month|
      month.strftime("%Y-%m")
    }

    # ユーザーごとの商談数(月)のデータ
    users = User.all
    users_data = []
    users.each do |user|
      # 月ごとの商談数の配列を作成
      month_count = months.map {|month|
        Activity.where(activity_type: "取引", start_date_time: month.all_month, creator_id: user.id).or(Activity.where(activity_type: "取引", start_date_time: month.all_month, attender_id: user.id)).count
      }
      users_data << month_count
    end
    users_data << [3, 3, 3, 3, 3, 3] # 目標値

    chart = LazyHighCharts::HighChart.new('graph', :style=>"height:350px") do |c|
      c.xAxis(categories: months_data, title: {text: '月'})
      c.yAxis(title: {text: '回数'})
      users.each do |user|
        c.series(name: user.name, data: users_data[user.id - 1], type: "")
      end
      c.series(name: '目標', data: users_data[users.count])
      c.legend(alignColumns: false, borderWidth: 1)
    end
  end

end