
ActiveRecord::Schema[7.1].define(version: 2024_05_17_084454) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "diary_id", null: false
    t.bigint "question_id", null: false
    t.bigint "choose_emotion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choose_emotion_id"], name: "index_answers_on_choose_emotion_id"
    t.index ["diary_id"], name: "index_answers_on_diary_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "choose_emotions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "text", null: false
    t.integer "level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diaries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diary_questions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "diary_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_diary_questions_on_diary_id"
    t.index ["question_id"], name: "index_diary_questions_on_question_id"
  end

  create_table "grade_classes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "grade", null: false
    t.integer "class_num", null: false
    t.integer "school_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_emotions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "choose_emotion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choose_emotion_id"], name: "index_question_emotions_on_choose_emotion_id"
    t.index ["question_id"], name: "index_question_emotions_on_question_id"
  end

  create_table "questions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stamps", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "diary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_stamps_on_diary_id"
    t.index ["user_id"], name: "index_stamps_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "uid", null: false
    t.string "provider"
    t.string "name"
    t.integer "role", default: 0, null: false
    t.bigint "grade_class_id"
    t.integer "student_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "additional_info_provided"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["grade_class_id"], name: "index_users_on_grade_class_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "choose_emotions"
  add_foreign_key "answers", "diaries"
  add_foreign_key "answers", "questions"
  add_foreign_key "diary_questions", "diaries"
  add_foreign_key "diary_questions", "questions"
  add_foreign_key "question_emotions", "choose_emotions"
  add_foreign_key "question_emotions", "questions"
  add_foreign_key "stamps", "diaries"
  add_foreign_key "stamps", "users"
  add_foreign_key "users", "grade_classes"
end
