class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.string  :name,                   null: false,             comment: "名前"
      t.string  :kana,                                            comment: "かな"
      t.string  :phone,                                           comment: "電話番号"
      t.string  :email,                                           comment: "メールアドレス"
      t.integer :contact_id,             null: false, default: 1, comment: "連絡方法ID"
      t.integer :gender_id,                                       comment: "性別ID"
      t.date    :birth,                                           comment: "生年月日"
      t.integer :age,                                             comment: "年齢"
      t.string  :postal_code,                                     comment: "郵便番号"
      t.integer :prefecture_id,                                   comment: "都道府県ID"
      t.string  :address,                                         comment: "住所"
      t.integer :household_id,                                    comment: "世帯ID"
      t.integer :occupation_id,                                   comment: "職業ID"
      t.string  :company,                                         comment: "勤務先"
      t.integer :annual_income_range_id,                          comment: "年収帯ID"
      t.integer :annual_income,                                   comment: "年収"
      t.timestamps
    end
  end
end