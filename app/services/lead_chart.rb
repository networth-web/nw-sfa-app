class LeadChart

  def self.chart
    if Lead.exists?

      # 月の配列を作成
      end_date = Date.today.change(day: 1)
      start_date = end_date - 5.months
      months = (start_date..end_date).select{|d| d.day == 1}

      # 人数を取得
      lead_count = months.map {|month|
        Lead.where(created_at: month.all_month).count
      }

      # 表示用に変換
      months_data = months.map {|month|
        month.strftime("%Y-%m")
      }

      # チャートを生成
      chart = LazyHighCharts::HighChart.new('graph', :style=>"height:300px") do |c|
        c.chart(type: "column")
        # c.title(text: "新規リード")
        c.xAxis(categories: months_data, title: {text: '月'}, gridLineWidth: 0.5)
        c.yAxis(title: {text: '人'})
        c.series(name: "リード数", data: lead_count)
        c.legend(align: 'left', verticalAlign: 'top')
      end

    else
      return nil
    end
  end

end