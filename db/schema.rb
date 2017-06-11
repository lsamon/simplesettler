# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170610031011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_payments", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", id: :serial, force: :cascade do |t|
    t.string "user_id"
    t.string "appointment_date"
    t.boolean "require_translator"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.text "meta_keywords"
    t.integer "category_id"
    t.integer "status", default: 0
    t.string "external_url"
    t.boolean "featured", default: false
  end

  create_table "articles_categories", id: :serial, force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "media"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "image"
    t.integer "articles_count"
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.text "description"
    t.string "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slogan"
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.text "meta_keywords"
    t.integer "articles_count"
  end

  create_table "city_articles", id: :serial, force: :cascade do |t|
    t.integer "article_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_city_articles_on_article_id"
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "faqs", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "content"
  end

  create_table "feedbacks", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "city_id"
    t.integer "liveability"
    t.integer "safety"
    t.integer "movability"
    t.integer "weather"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "helpfuls", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.boolean "helped"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 5, scale: 2
    t.text "description"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.string "stripe_charge_id"
    t.string "amount_paid"
    t.integer "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

  create_table "user_details", id: :serial, force: :cascade do |t|
    t.string "visa_status"
    t.string "f_name"
    t.string "l_name"
    t.string "dob"
    t.string "country_of_passport"
    t.boolean "currently_in_aus"
    t.string "passport_expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "visa_help_type"
    t.boolean "is_currently_in_desired_country"
    t.boolean "done_ielts"
    t.string "visa_expiry_date"
    t.string "image"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visa_requirements", id: :serial, force: :cascade do |t|
    t.integer "visa_type_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visa_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
