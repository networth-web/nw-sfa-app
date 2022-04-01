# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do |n|
#   User.create(title: "test{n}人目", content:"test！#{n}回目")
# end

# User
10.times do |n|
  n = n + 1
  if n == 1
    role = 1
  elsif n.between?(2, 4)
    role = 2
  elsif n.between?(5, 7)
    role = 3
  else
    role = 4
  end
  
  User.create(
    name: "ユーザー#{n}",
    role: role,
    email: "user#{n}@mail",
    password: 'password'
  )
end

# Source
10.times do |n|
  n = n + 1
  if n.between?(1, 5)
    approval = true
  else
    approval = false
  end

  Source.create(
    name: "ソース#{n}",
    description: "説明説明説明",
    approval: approval,
    user_id: n
  )
end

# SalesProcess
10.times do |n|
  n = n + 1

  if n.between?(1, 5)
    SalesProcess.create(
      name: "営業プロセス#{n}",
      description: "説明説明説明"
    )
  end
end

# Seminar
10.times do |n|
  n = n + 1
  if n.between?(1, 5)
    format_value = "来場"
    start_date_time = "2022-03-0#{n} 10:00"
    end_date_time = "2022-03-0#{n} 11:00"
  elsif n.between?(6, 9)
    format_value = "オンライン"
    start_date_time = "2022-03-0#{n} 10:00"
    end_date_time = "2022-03-0#{n} 11:00"
  else
    format_value = "オンライン"
    start_date_time = "2022-03-#{n} 10:00"
    end_date_time = "2022-03-#{n} 11:00"
  end

  Seminar.create(
    title: "セミナー#{n}",
    format: format_value,
    instructor: "講師",
    start_date_time: start_date_time,
    end_date_time: end_date_time,
    description: "説明説明説明",
    url: "zoom.com",
  )
end

Lead
10.times do |n|
  n = n + 1

  if n.between?(1, 5)
    sales_process_id = n
  else
    sales_process_id = 5
  end

  lead = Lead.create(
    name: "リード#{n}",
    kana: "かな",
    phone: "00000000000",
    email: "mail#{n}@mail.com",
    contact_id: 1,
    gender_id: 1,
    birth: "1990-01-01",
    age: 30,
    postal_code: "0000000",
    prefecture_id: n,
    address: "東京都中央区銀座1丁目1-1",
    household_id: 1,
    occupation_id: 1,
    company: "会社名",
    annual_income_range_id: 1,
    annual_income: n.to_s + "00",
    remark: "メモメモメモ",
    source_id: n,
    sales_process_id: sales_process_id,
    owner_id: n,
    closer_id: n
  )

  if n.between?(1, 5)
    scheduled_date_time = "2022-03-0#{n} 10:00"
    first_preferred_date_time = "2022-03-0#{n} 10:00"
    second_preferred_date_time = "2022-03-0#{n + 1} 10:00"
    third_preferred_date_time = "2022-03-0#{n + 2} 10:00"    
  elsif n == 8
    scheduled_date_time = "2022-03-0#{n} 10:00"
    first_preferred_date_time = "2022-03-0#{n} 10:00"
    second_preferred_date_time = "2022-03-0#{n + 1} 10:00"
    third_preferred_date_time = "2022-03-#{n + 2} 10:00"
  elsif n == 9
    scheduled_date_time = "2022-03-0#{n} 10:00"
    first_preferred_date_time = "2022-03-0#{n} 10:00"
    second_preferred_date_time = "2022-03-#{n + 1} 10:00"
    third_preferred_date_time = "2022-03-#{n + 2} 10:00"
  else
    scheduled_date_time = "2022-03-#{n} 10:00"
    first_preferred_date_time = "2022-03-#{n} 10:00"
    second_preferred_date_time = "2022-03-#{n + 1} 10:00"
    third_preferred_date_time = "2022-03-#{n + 2} 10:00"
  end

  lead.create_lead_seminar(
    scheduled_date_time: scheduled_date_time,
    first_preferred_date_time: first_preferred_date_time,
    second_preferred_date_time: second_preferred_date_time,
    third_preferred_date_time: third_preferred_date_time,
    level_id: 1,
    attend_reason: "出席理由出席理由出席理由",
    experience_investment: "投資経験投資経験投資経験",
    interest_investment: "興味のある投資興味のある投資興味のある投資",
    question: "質問質問質問",
    tracking_id: "トラッキングID",
    attend_id: 1,
    approval_id: 1,
    disapproval_reason: "不承認理由不承認理由不承認理由",
    seminar_id: n
  )
end

# TemplateModel
TemplateModel.create(
  template_type: "面談",
  template_text: "面談項目１\r\n\r\n面談項目２\r\n\r\n面談項目3"
)
TemplateModel.create(
  template_type: "商談",
  template_text: "商談項目１\r\n\r\n商談項目２\r\n\r\n商談項目3"
)

# Property
10.times do |n|
  n = n + 1

  Property.create(
    name: "物件#{n}",
    price: n.to_s + "000"
  )
end