module OutputCsv
  extend ActiveSupport::Concern

  def output_csv(leads)
    csv_data = CSV.generate do |csv|
      # ヘッダーを定義
      header = [
        "名前",
        "かな",
        "電話番号",
        "メールアドレス",
        "連絡方法ID",
        "性別ID",
        "生年月日",
        "年齢",
        "郵便番号",
        "都道府県ID",
        "住所",
        "世帯ID",
        "職業ID",
        "勤務先",
        "年収帯ID",
        "年収",
        "メモ",
        "登録日時",
        "ソースID",
        "営業プロセスID",
        "担当者ID",
        "クローザーID",
        "予定日時",
        "第１希望日時",
        "第２希望日時",
        "第３希望日時",
        "レベルID",
        "出席理由",
        "投資経験",
        "興味のある投資",
        "質問",
        "トラッキングID",
        "出席ID",
        "承認ID",
        "不承認理由",
        "セミナーID"
      ]
      csv << header

      leads.each do |lead|

        # 値を定義
        values = [
          lead.name,
          lead.kana,
          lead.phone,
          lead.email,
          lead.contact_id,
          lead.gender_id,
          lead.birth,
          lead.age,
          lead.postal_code,
          lead.prefecture_id,
          lead.address,
          lead.household_id,
          lead.occupation_id,
          lead.company,
          lead.annual_income_range_id,
          lead.annual_income,
          lead.remark,
          lead.created_at,
          lead.source_id,
          lead.sales_process_id,
          lead.owner_id,
          lead.closer_id,
          lead.lead_seminar.scheduled_date_time,
          lead.lead_seminar.first_preferred_date_time,
          lead.lead_seminar.second_preferred_date_time,
          lead.lead_seminar.third_preferred_date_time,
          lead.lead_seminar.level_id,
          lead.lead_seminar.attend_reason,
          lead.lead_seminar.experience_investment,
          lead.lead_seminar.interest_investment,
          lead.lead_seminar.question,
          lead.lead_seminar.tracking_id,
          lead.lead_seminar.attend_id,
          lead.lead_seminar.approval_id,
          lead.lead_seminar.disapproval_reason,
          lead.lead_seminar.seminar_id
        ]
        csv << values
      end
    end

    send_data(csv_data, filename: "leads.csv")
  end
end


