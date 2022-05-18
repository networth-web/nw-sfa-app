class LeadChart
  def self.chart
    # 過去半年の1日の配列を作成
    last_day = Date.today.change(day: 1) # 今月1日
    first_day = Date.today - 6.months # 半年前
    months = (first_day..last_day).select{|d|d.day == 1}

    # 月表示データ
    months_data = months.map {|month|
      month.strftime("%Y-%m")
    }

    # 人数を取得
    lead_count = months.map {|month|
      Lead.where(created_at: month.all_month).count
    }

    # チャートを生成
    chart = LazyHighCharts::HighChart.new('graph', :style=>"height:300px") do |c|
      c.chart(type: "column")
      c.xAxis(categories: months_data, title: {text: '月'}, gridLineWidth: 0.5)
      c.yAxis(title: {text: '人'})
      c.series(name: "リード数", data: lead_count)
      c.legend(align: 'left', verticalAlign: 'top')
    end
  end
end