class SourceChart
  def self.chart
    # ソースごとのリード数
    sources = Source.all.includes(:leads)
    sources_data = sources.map {|source|
      ["#{ source.name }", source.leads.count]
    }

    # チャートを生成
    chart = LazyHighCharts::HighChart.new('graph', :style=>"height:300px") do |c|
      c.chart(type: "pie")
      c.series(name: 'リード数', data: sources_data)
    end
  end
end