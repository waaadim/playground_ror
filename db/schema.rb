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

ActiveRecord::Schema.define(version: 20171031185239) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.text     "link"
    t.integer  "social_network_id"
    t.integer  "poster_id"
    t.date     "publish_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "articles", ["poster_id"], name: "index_articles_on_poster_id"
  add_index "articles", ["social_network_id"], name: "index_articles_on_social_network_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_person_groups", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "person_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "clients_person_groups", ["client_id"], name: "index_clients_person_groups_on_client_id"
  add_index "clients_person_groups", ["person_group_id"], name: "index_clients_person_groups_on_person_group_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "federal_legislators", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_translators", force: :cascade do |t|
    t.integer  "language_id"
    t.integer  "translator_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "languages_translators", ["language_id"], name: "index_languages_translators_on_language_id"
  add_index "languages_translators", ["translator_id"], name: "index_languages_translators_on_translator_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_groups_posters", force: :cascade do |t|
    t.integer  "poster_id"
    t.integer  "person_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "person_groups_posters", ["person_group_id"], name: "index_person_groups_posters_on_person_group_id"
  add_index "person_groups_posters", ["poster_id"], name: "index_person_groups_posters_on_poster_id"

  create_table "posters", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "federal_legislator_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "posters", ["federal_legislator_id"], name: "index_posters_on_federal_legislator_id"
  add_index "posters", ["person_id"], name: "index_posters_on_person_id"

  create_table "social_networks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "social_networks", ["name"], name: "index_social_networks_on_name"

  create_table "translators", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "source"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "translators", ["country_id"], name: "index_translators_on_country_id"

end
