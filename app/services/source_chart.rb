class SourceChart

  def self.chart
    if Lead.exists?

      # データを定義
      sources = Source.all
      sources_data = sources.map {|source|
        ["#{ source.name }", source.leads.count]
      }

      # チャートを生成
      chart = LazyHighCharts::HighChart.new('graph', :style=>"height:300px") do |c|
        c.chart(type: "pie")
        # c.title(text: "ソース")
        c.series(name: 'リード数', data: sources_data)
      end

    else
      return nil
    end
  end

end