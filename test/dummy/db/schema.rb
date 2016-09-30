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

ActiveRecord::Schema.define(version: 20160828172134) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "fluent_blocks", force: :cascade  do |t|
    t.string   "title"
    t.text     "content",    limit: 65535
    t.string   "name",       limit: 128
    t.string   "type"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_blocks_on_name", unique: true, using: :btree
  end

  create_table "fluent_menu_items", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "parent_id"
    t.string   "title"
    t.string   "url"
    t.string   "type"
    t.integer  "order"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "data_push"
  end

  create_table "fluent_menus", force: :cascade do |t|
    t.string   "title"
    t.string   "name",        limit: 128
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_menus_on_name", unique: true, using: :btree
  end

  create_table "fluent_news", force: :cascade do |t|
    t.string   "title"
    t.text     "content",    limit: 16777215
    t.integer  "author"
    t.integer  "updater"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status"
    t.text     "preview",    limit: 65535
    t.index ["author"], name: "author", using: :btree
    t.index ["updater"], name: "updater", using: :btree
  end

  create_table "fluent_nodes", force: :cascade do |t|
    t.string   "title"
    t.text     "content",    limit: 16777215
    t.integer  "author"
    t.integer  "updater"
    t.string   "slug",       limit: 128
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.boolean  "status"
    t.index ["author"], name: "author", using: :btree
    t.index ["slug"], name: "slug", unique: true, using: :btree
    t.index ["updater"], name: "updater", using: :btree
  end

  create_table "fluent_roles", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "fluent_roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "fluent_users", force: :cascade do |t|
    t.string   "email",                  limit: 128, default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token",   limit: 128
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 128
    t.string   "confirmation_token",     limit: 190
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "type"
    t.index ["confirmation_token"], name: "index_fluent_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  # create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
  #   t.string   "var",        limit: 128,      null: false
  #   t.text     "value",      limit: 16777215
  #   t.integer  "thing_id"
  #   t.string   "thing_type", limit: 30
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  #   t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree
  # end

  add_foreign_key "fluent_news", "fluent_users", column: "author", name: "fluent_news_ibfk_1"
  add_foreign_key "fluent_news", "fluent_users", column: "updater", name: "fluent_news_ibfk_2"
  add_foreign_key "fluent_nodes", "fluent_users", column: "author", name: "fluent_nodes_ibfk_1"
  add_foreign_key "fluent_nodes", "fluent_users", column: "updater", name: "fluent_nodes_ibfk_2"
end
