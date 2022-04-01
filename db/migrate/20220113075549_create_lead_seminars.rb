class CreateLeadSeminars < ActiveRecord::Migration[6.0]
  def change
    create_table :lead_seminars do |t|
      t.datetime   :scheduled_date_time,                                               comment: "予定日時"
      t.datetime   :first_preferred_date_time,                                         comment: "第１希望日時"
      t.datetime   :second_preferred_date_time,                                        comment: "第２希望日時"
      t.datetime   :third_preferred_date_time,                                         comment: "第３希望日時"
      t.integer    :level_id,                                                          comment: "レベルID"
      t.text       :attend_reason,                                                     comment: "出席理由"
      t.text       :experience_investment,                                             comment: "投資経験"
      t.text       :interest_investment,                                               comment: "興味のある投資"
      t.text       :question,                                                          comment: "質問"
      t.string     :tracking_id,                                                       comment: "トラッキングID"
      t.integer    :attend_id,             null: false, default: 4,                    comment: "出席ID"
      t.integer    :approval_id,           null: false,                                comment: "承認ID"
      t.text       :disapproval_reason,                                                comment: "不承認理由"
      t.references :lead,                  null: false,             foreign_key: true
      t.references :seminar,                                        foreign_key: true, comment: "セミナーID"
      t.timestamps
    end
  end
end