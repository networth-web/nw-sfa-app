class OrderChart

  def self.chart
    if Activity.where(order_type: "契約").exists?

      # 今月の1日を定義
      end_date = Date.today.change(day: 1)
      # 5ヶ月前を定義
      start_date = end_date - 5.months
      # 過去5ヶ月の1日の配列を作成
      months = (start_date..end_date).select{|d| d.day == 1}

      # ユーザーごとのハッシュを作成
      # ユーザー配列を定義
      users = User.all
      # users_dataには各ユーザーのデータを格納
      users_data = {}
      users.each do |user|
        # 月ごとのユーザーの商談数をmonth_countに配列で格納
        month_count = months.map {|month|
          # 月ごとのユーザーの商談数
          Activity.where(order_type: "契約", start_date_time: month.all_month, creator_id: user.id).or(Activity.where(order_type: "契約", start_date_time: month.all_month, attender_id: user.id)).count
        }
        # それぞれのユーザーのハッシュに月ごとのカウントの配列を格納
        users_data["#{user.id}"] = month_count
      end

      # 目標値ハッシュを作成
      users_data["目標"] = months.map {|month| month = 3 }

      # 表示用に変換
      months_data = months.map {|month|
        month.strftime("%Y-%m")
      }

      chart = LazyHighCharts::HighChart.new('graph', :style=>"height:350px") do |c|
        # c.title(text: "引継ぎ")
        c.xAxis(categories: months_data, title: {text: '月'})
        c.yAxis(title: {text: '回数'})
        users.each do |user|
          c.series(name: user.name, data: users_data["#{user.id}"], type: "")
        end
        c.series(name: '目標', data: users_data["目標"])
        # c.legend(align: 'left', verticalAlign: 'top')
        c.legend(alignColumns: false, borderWidth: 1)
      end

    else
      return nil
    end
  end

end