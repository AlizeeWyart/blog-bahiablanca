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

ActiveRecord::Schema.define(version: 20170123082208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "short_description"
    t.text     "content"
    t.date     "date"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "photo"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.integer  "likes",             default: 0
    t.integer  "category_id"
    t.integer  "heart",             default: 0
    t.string   "status",            default: "EN ATTENTE"
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.text     "short_description"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "photo"
  end

  create_table "category4as", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_category4as_on_article_id", using: :btree
    t.index ["category_id"], name: "index_category4as_on_category_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "message"
    t.boolean  "hidden",     default: false
    t.boolean  "seen",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "style"
    t.string   "photo"
    t.string   "photo2"
    t.text     "text"
    t.string   "video"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_description"
    t.string   "photo_description2"
    t.integer  "order",              default: 0
    t.index ["article_id"], name: "index_contents_on_article_id", using: :btree
  end

  create_table "page_infos", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_page_infos_on_page_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "region4as", force: :cascade do |t|
    t.integer  "region_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_region4as_on_article_id", using: :btree
    t.index ["region_id"], name: "index_region4as_on_region_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "short_description"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "twitter_account"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "users"
  add_foreign_key "category4as", "articles"
  add_foreign_key "category4as", "categories"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "contents", "articles"
  add_foreign_key "page_infos", "pages"
  add_foreign_key "region4as", "articles"
  add_foreign_key "region4as", "regions"
end
