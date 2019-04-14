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

ActiveRecord::Schema.define(version: 20190414132100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string "user_id"
    t.boolean "require_translator"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "appointment_type", default: 0
    t.datetime "appointment_date"
  end

  create_table "articles", force: :cascade do |t|
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
    t.integer "content_type", default: 0
  end

  create_table "articles_categories", force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "average_caches", force: :cascade do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "avg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_average_caches_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_average_caches_on_rater_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "image"
    t.integer "articles_count"
  end

  create_table "cities", force: :cascade do |t|
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

  create_table "city_articles", force: :cascade do |t|
    t.integer "article_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_city_articles_on_article_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "content"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "city_id"
    t.integer "liveability"
    t.integer "safety"
    t.integer "movability"
    t.integer "weather"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
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

  create_table "overall_averages", force: :cascade do |t|
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "overall_avg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_overall_averages_on_rateable_type_and_rateable_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.text "description"
    t.integer "status", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.string "stripe_charge_id"
    t.string "amount_paid"
    t.integer "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

  create_table "rates", force: :cascade do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "stars", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string "cacheable_type"
    t.bigint "cacheable_id"
    t.float "avg", null: false
    t.integer "qty", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_type", "cacheable_id"], name: "index_rating_caches_on_cacheable_type_and_cacheable_id"
  end

  create_table "user_details", force: :cascade do |t|
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
    t.date "visa_expiry_date"
    t.string "image"
    t.integer "country_id"
    t.string "resume"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "kind", default: 1
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visa_requirements", force: :cascade do |t|
    t.integer "visa_type_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visa_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
