# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_04_073349) do

  create_table "action_text_rich_texts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "activity_type", null: false
    t.string "action_name"
    t.integer "meeting_type"
    t.integer "order_type"
    t.text "overview", null: false
    t.datetime "start_date_time", null: false
    t.datetime "end_date_time"
    t.bigint "lead_id", null: false
    t.bigint "creator_id", null: false
    t.bigint "attender_id"
    t.bigint "property_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attender_id"], name: "index_activities_on_attender_id"
    t.index ["creator_id"], name: "index_activities_on_creator_id"
    t.index ["lead_id"], name: "index_activities_on_lead_id"
    t.index ["property_id"], name: "index_activities_on_property_id"
  end

  create_table "hides", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "reason", null: false
    t.bigint "lead_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_hides_on_lead_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lead_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_images_on_lead_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "lead_seminars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "scheduled_date_time", comment: "予定日時"
    t.datetime "first_preferred_date_time", comment: "第１希望日時"
    t.datetime "second_preferred_date_time", comment: "第２希望日時"
    t.datetime "third_preferred_date_time", comment: "第３希望日時"
    t.integer "level_id", comment: "レベルID"
    t.text "attend_reason", comment: "出席理由"
    t.text "experience_investment", comment: "投資経験"
    t.text "interest_investment", comment: "興味のある投資"
    t.text "question", comment: "質問"
    t.string "tracking_id", comment: "トラッキングID"
    t.integer "attend_id", default: 4, null: false, comment: "出席ID"
    t.integer "approval_id", null: false, comment: "承認ID"
    t.text "disapproval_reason", comment: "不承認理由"
    t.bigint "lead_id", null: false
    t.bigint "seminar_id", comment: "セミナーID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_lead_seminars_on_lead_id"
    t.index ["seminar_id"], name: "index_lead_seminars_on_seminar_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "名前"
    t.string "kana", comment: "かな"
    t.string "phone", comment: "電話番号"
    t.string "email", comment: "メールアドレス"
    t.integer "contact_id", default: 1, null: false, comment: "連絡方法ID"
    t.integer "gender_id", comment: "性別ID"
    t.date "birth", comment: "生年月日"
    t.integer "age", comment: "年齢"
    t.string "postal_code", comment: "郵便番号"
    t.integer "prefecture_id", comment: "都道府県ID"
    t.string "address", comment: "住所"
    t.integer "household_id", comment: "世帯ID"
    t.integer "occupation_id", comment: "職業ID"
    t.string "company", comment: "勤務先"
    t.integer "annual_income_range_id", comment: "年収帯ID"
    t.integer "annual_income", comment: "年収"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "source_id", null: false, comment: "ソースID"
    t.bigint "sales_process_id", default: 1, null: false, comment: "営業プロセスID"
    t.bigint "owner_id", comment: "担当者ID"
    t.bigint "closer_id", comment: "クローザーID"
    t.index ["closer_id"], name: "index_leads_on_closer_id"
    t.index ["owner_id"], name: "index_leads_on_owner_id"
    t.index ["sales_process_id"], name: "index_leads_on_sales_process_id"
    t.index ["source_id"], name: "index_leads_on_source_id"
  end

  create_table "losts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "reason", null: false
    t.bigint "lead_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_losts_on_lead_id"
    t.index ["user_id"], name: "index_losts_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "notification_type", null: false
    t.boolean "checked", default: false, null: false
    t.integer "lead_count"
    t.bigint "visitor_id"
    t.bigint "visited_id", null: false
    t.bigint "lead_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_notifications_on_lead_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_reads_on_lead_id"
    t.index ["user_id"], name: "index_reads_on_user_id"
  end

  create_table "sales_processes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "schedule_date_time", null: false
    t.bigint "lead_id", null: false
    t.bigint "creator_id", null: false
    t.bigint "attender_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attender_id"], name: "index_schedules_on_attender_id"
    t.index ["creator_id"], name: "index_schedules_on_creator_id"
    t.index ["lead_id"], name: "index_schedules_on_lead_id"
  end

  create_table "seminars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "instructor", null: false
    t.datetime "start_date_time", null: false
    t.datetime "end_date_time", null: false
    t.integer "format", null: false
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sources", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.boolean "approval", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sources_on_user_id"
  end

  create_table "template_models", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "template_type", null: false
    t.text "template_text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "role", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "leads"
  add_foreign_key "activities", "properties"
  add_foreign_key "activities", "users", column: "attender_id"
  add_foreign_key "activities", "users", column: "creator_id"
  add_foreign_key "hides", "leads"
  add_foreign_key "images", "leads"
  add_foreign_key "images", "users"
  add_foreign_key "lead_seminars", "leads"
  add_foreign_key "lead_seminars", "seminars"
  add_foreign_key "leads", "sales_processes"
  add_foreign_key "leads", "sources"
  add_foreign_key "leads", "users", column: "closer_id"
  add_foreign_key "leads", "users", column: "owner_id"
  add_foreign_key "losts", "leads"
  add_foreign_key "losts", "users"
  add_foreign_key "notifications", "leads"
  add_foreign_key "notifications", "users", column: "visited_id"
  add_foreign_key "notifications", "users", column: "visitor_id"
  add_foreign_key "reads", "leads"
  add_foreign_key "reads", "users"
  add_foreign_key "schedules", "leads"
  add_foreign_key "schedules", "users", column: "attender_id"
  add_foreign_key "schedules", "users", column: "creator_id"
  add_foreign_key "sources", "users"
end
