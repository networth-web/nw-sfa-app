module ImportCsv
  extend ActiveSupport::Concern

  def import_csv(file)
    errors = [] # エラー配列を定義
    
    csv_header_1 = { 
      "名前" => 'name',
      "かな" => 'kana',
      "電話番号" => 'phone',
      "メールアドレス" => 'email',
      "連絡方法ID" => 'contact_id',
      "性別ID" => 'gender_id',
      "生年月日" => 'birth',
      "年齢" => 'age',
      "郵便番号" => 'postal_code',
      "都道府県ID" => 'prefecture_id',
      "住所" => 'address',
      "世帯ID" => 'household_id',
      "職業ID" => 'occupation_id',
      "勤務先" => 'company',
      "年収帯" => 'annual_income_range',
      "年収" => 'annual_income',
      "メモ" => 'remark',
      "登録日時" => 'created_at',
      "ソースID" => 'source_id',
      "営業プロセスID" => 'sales_process_id',
      "担当者ID" => 'owner_id',
      "クローザーID" => 'closer_id',
    }
    csv_header_2 = { 
      "予定日時" => 'scheduled_date_time',
      "第１希望日時" => 'first_preferred_date_time',
      "第２希望日時" => 'second_preferred_date_time',
      "第３希望日時" => 'third_preferred_date_time',
      "レベルID" => 'level_id',
      "出席理由" => 'attend_reason',
      "投資経験" => 'experience_investment',
      "興味のある投資" => 'interest_investment',
      "質問" => 'question',
      "トラッキングID" => 'tracking_id',
      "出席ID" => 'attend_id',
      "承認ID" => 'approval_id',
      "不承認理由" => 'disapproval_reason',
      "セミナーID" => 'seminar_id'
    }
  
    ActiveRecord::Base.transaction do
      # headers: true：ヘッダーを読み飛ばしてくれます
      # skip_blanks: true：空の行を読み飛ばしてくれます
      # with_index(2): indexを2始まりにする（行数を指定するため）
      CSV.foreach(file.path, headers: true, skip_blanks: true).with_index(2) do |row, row_number|
        lead = Lead.new
        # ヘッダーのキーにあるもの以外を除外してハッシュにする
        row_hash_1 = row.to_hash.slice(*csv_header_1.keys)
        # キーとバリューを逆にしてleadにセット
        lead.attributes = row_hash_1.transform_keys(&csv_header_1.method(:[]))

        # sales_process_idに値が無ければ1をセット
        if lead.sales_process_id.blank?
          lead.sales_process_id = 1
        end

        # バリデーションに引っかかったらerrorsに格納
        if lead.invalid?
          errors.push({:row_num => row_number, :messages => lead.errors.full_messages})
          raise ActiveRecord::Rollback
        end

        lead_seminar = lead.build_lead_seminar
        row_hash_2 = row.to_hash.slice(*csv_header_2.keys)
        lead_seminar.attributes = row_hash_2.transform_keys(&csv_header_2.method(:[]))

        # scheduled_date_timeに値があって、一致するセミナーがあればセット
        if lead_seminar.scheduled_date_time.present?
          if Seminar.where(start_date_time: lead_seminar.scheduled_date_time).exists?
            seminar = Seminar.where(start_date_time: lead_seminar.scheduled_date_time).first
            lead_seminar.seminar_id = seminar.id
          end
        end

        # attend_idに値が無ければ3をセット
        if lead_seminar.attend_id.blank?
          lead_seminar.attend_id = 3
        end

        # approval_idに値がなくてleadのsourceのapprovalがtrueなら3をセット、falseなら4をセット
        if lead_seminar.approval_id.blank?
          if lead.source.approval
            lead_seminar.approval_id = 3
          else
            lead_seminar.approval_id = 4
          end
        end

        if lead_seminar.invalid?
          errors.push({:row_num => row_number, :messages => lead_seminar.errors.full_messages})
          raise ActiveRecord::Rollback
        end
        
        # バリデーションが正しくない場合に例外を発生される
        lead.save
      end
    end

    return errors
  end
end