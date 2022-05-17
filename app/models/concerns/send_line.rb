module SendLine
  extend ActiveSupport::Concern

  TOKEN_FOR_CHANGE_USER = "uj3YLfXI4bBu3v9mNDoN4CaAaxzmWsbpa0hF4AfGEcw"
  TOKEN_FOR_CSV_IMPORT = "95pM3lVLO9wC1Q6x1hCsXlauQq20i1yA8dnKNGt3Ooy"
  URI = URI.parse("https://notify-api.line.me/api/notify")

  class_methods do
    # ユーザー変更時のメッセージ
    def create_change_user_msg(lead, after_user, type_name, scheduled_seminar_date)
"#{type_name}：#{after_user.name}
リード：#{lead.name}様
セミナー：#{scheduled_seminar_date}"
    end

    # CSVインポート時のメッセージ
    def create_csv_import_msg(leads)
      str = "\n"
      leads.each{|lead|str << "#{lead.name}：#{lead.source.name}\n"}
      str << "計#{leads.count}名"
    end

    # リクエスト内容を作成
    def make_request(msg, token)
      request = Net::HTTP::Post.new(URI)
      request["Authorization"] = "Bearer #{token}"
      request.set_form_data(message: msg)
      request
    end

    # LINE送信メソッド（ユーザー割振時）
    def send_line_for_change_user(notify_type, lead, after_user)
      # クローザー変更は通知しない（クローザーにも通知する場合は以下の処理をコメントアウトしてください）
      if notify_type == 3
        return
      end
      notify_type == 2 ? type_name = "担当者" : type_name = "クローザー"

      # 紐づいているセミナーがあればセミナーの開催日を取得
      scheduled_seminar_date = "セミナー無し"
      if lead.lead_seminar && lead.lead_seminar.seminar
        scheduled_seminar_date = lead.lead_seminar.seminar.start_date_time.strftime("%m月 %d日")
      end

      # メッセージ作成
      msg = create_change_user_msg(lead, after_user, type_name, scheduled_seminar_date)

      request = make_request(msg, TOKEN_FOR_CHANGE_USER)
      response = Net::HTTP.start(URI.hostname, URI.port, use_ssl: URI.scheme == "https") do |https|
        https.request(request)
      end
    end

    # LINE送信メソッド（CSVインポート時）
    def send_line_for_csv_import(lead_count)
      leads = Lead.order(id: :desc).limit(lead_count)
      msg = create_csv_import_msg(leads) # メッセージ作成
      request = make_request(msg, TOKEN_FOR_CSV_IMPORT) # リクエスト作成
      response = Net::HTTP.start(URI.hostname, URI.port, use_ssl: URI.scheme == "https") do |https|
        https.request(request)
      end
    end
  end
end
