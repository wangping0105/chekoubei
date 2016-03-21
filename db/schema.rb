# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160319125431) do

  create_table "addresses", force: :cascade do |t|
    t.float    "lat",              limit: 24
    t.float    "lng",              limit: 24
    t.integer  "addressable_id",   limit: 4
    t.string   "addressable_type", limit: 255
    t.integer  "country_id",       limit: 4
    t.integer  "province_id",      limit: 4
    t.integer  "city_id",          limit: 4
    t.integer  "district_id",      limit: 4
    t.string   "detail_address",   limit: 255
    t.string   "tel",              limit: 255
    t.string   "phone",            limit: 255
    t.string   "url",              limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["district_id"], name: "index_addresses_on_district_id", using: :btree
  add_index "addresses", ["lat", "lng"], name: "index_addresses_on_lat_and_lng", using: :btree
  add_index "addresses", ["province_id"], name: "index_addresses_on_province_id", using: :btree

  create_table "app_versions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "app_type",     limit: 4
    t.string   "version_name", limit: 255
    t.string   "version_code", limit: 255
    t.string   "download_url", limit: 255
    t.integer  "upgrade",      limit: 4
    t.text     "changelogs",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "attachmentable_id",   limit: 4
    t.string   "attachmentable_type", limit: 255
    t.string   "name",                limit: 255
    t.string   "file_file_name",      limit: 255
    t.string   "file_content_type",   limit: 255
    t.integer  "file_file_size",      limit: 4
    t.datetime "file_updated_at"
    t.datetime "deleted_at"
    t.text     "note",                limit: 65535
    t.string   "sub_type",            limit: 255
    t.integer  "attachment_position", limit: 4
    t.string   "qiniu_persistent_id", limit: 255
    t.datetime "updated_at",                        null: false
    t.datetime "created_at",                        null: false
  end

  add_index "attachments", ["attachmentable_id", "attachmentable_type"], name: "index_attachments_on_attachmentable_id_and_attachmentable_type", using: :btree
  add_index "attachments", ["qiniu_persistent_id"], name: "index_attachments_on_qiniu_persistent_id", using: :btree
  add_index "attachments", ["user_id"], name: "index_attachments_on_user_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "pinyin",       limit: 255
    t.integer  "parent_id",    limit: 4
    t.integer  "stores_count", limit: 4
    t.integer  "brand_type",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "brands", ["name"], name: "index_brands_on_name", using: :btree
  add_index "brands", ["parent_id"], name: "index_brands_on_parent_id", using: :btree
  add_index "brands", ["pinyin"], name: "index_brands_on_pinyin", using: :btree

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "brand_id",    limit: 4
    t.string   "model_no",    limit: 255
    t.string   "color",       limit: 255
    t.float    "distance",    limit: 24
    t.date     "on_time"
    t.text     "description", limit: 65535
    t.integer  "car_type",    limit: 4,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "cars", ["brand_id"], name: "index_cars_on_brand_id", using: :btree
  add_index "cars", ["user_id"], name: "index_cars_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "pinyin",      limit: 255
    t.integer  "province_id", limit: 4
    t.integer  "sort",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree
  add_index "cities", ["pinyin"], name: "index_cities_on_pinyin", using: :btree
  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pinyin",     limit: 255
    t.integer  "sort",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree
  add_index "countries", ["pinyin"], name: "index_countries_on_pinyin", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pinyin",     limit: 255
    t.integer  "city_id",    limit: 4
    t.integer  "sort",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree
  add_index "districts", ["name"], name: "index_districts_on_name", using: :btree
  add_index "districts", ["pinyin"], name: "index_districts_on_pinyin", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pinyin",     limit: 255
    t.integer  "sort",       limit: 4
    t.integer  "country_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id", using: :btree
  add_index "provinces", ["name"], name: "index_provinces_on_name", using: :btree
  add_index "provinces", ["pinyin"], name: "index_provinces_on_pinyin", using: :btree

  create_table "sms_codes", force: :cascade do |t|
    t.integer  "users_id",   limit: 4
    t.string   "phone",      limit: 255
    t.string   "code",       limit: 255
    t.integer  "sms_type",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sms_codes", ["phone"], name: "index_sms_codes_on_phone", using: :btree
  add_index "sms_codes", ["users_id"], name: "index_sms_codes_on_users_id", using: :btree

  create_table "store_cars", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "store_id",   limit: 4
    t.integer  "car_id",     limit: 4
    t.float    "prices",     limit: 24
    t.integer  "status",     limit: 4,   default: 0
    t.boolean  "top",                    default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "store_cars", ["car_id"], name: "index_store_cars_on_car_id", using: :btree
  add_index "store_cars", ["store_id"], name: "index_store_cars_on_store_id", using: :btree

  create_table "store_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pinyin",     limit: 255
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "store_categories", ["name"], name: "index_store_categories_on_name", using: :btree
  add_index "store_categories", ["parent_id"], name: "index_store_categories_on_parent_id", using: :btree
  add_index "store_categories", ["pinyin"], name: "index_store_categories_on_pinyin", using: :btree

  create_table "store_category_relations", force: :cascade do |t|
    t.integer  "store_id",          limit: 4
    t.integer  "store_category_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "store_category_relations", ["store_category_id"], name: "index_store_category_relations_on_store_category_id", using: :btree
  add_index "store_category_relations", ["store_id"], name: "index_store_category_relations_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "pinyin",            limit: 255
    t.string   "short_name",        limit: 255
    t.text     "introduction",      limit: 65535
    t.integer  "store_category_id", limit: 4
    t.integer  "brand_id",          limit: 4
    t.integer  "store_type",        limit: 4
    t.string   "business_hours",    limit: 255
    t.integer  "level",             limit: 4
    t.integer  "order_count",       limit: 4
    t.integer  "deleted_at",        limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "stores", ["brand_id"], name: "index_stores_on_brand_id", using: :btree
  add_index "stores", ["name"], name: "index_stores_on_name", using: :btree
  add_index "stores", ["pinyin"], name: "index_stores_on_pinyin", using: :btree
  add_index "stores", ["store_category_id"], name: "index_stores_on_store_category_id", using: :btree

  create_table "user_devices", force: :cascade do |t|
    t.string   "uid",          limit: 255
    t.string   "device_token", limit: 255
    t.string   "client_id",    limit: 255
    t.integer  "platform",     limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_devices", ["user_id"], name: "index_user_devices_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "store_id",             limit: 4
    t.string   "phone",                limit: 255
    t.string   "name",                 limit: 255
    t.integer  "sex",                  limit: 4
    t.string   "authentication_token", limit: 255
    t.string   "password_digest",      limit: 255
    t.datetime "activated"
    t.integer  "role",                 limit: 4,   default: 0
    t.integer  "deleted_at",           limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", using: :btree
  add_index "users", ["store_id"], name: "index_users_on_store_id", using: :btree

end
