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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111110034914) do

  create_table "appimgs", :force => true do |t|
    t.string  "imgname"
    t.integer "app_id"
    t.string  "icon_path"
  end

  create_table "appsofts", :force => true do |t|
    t.string   "name"
    t.string   "size"
    t.string   "package_name"
    t.string   "brief"
    t.string   "author"
    t.string   "language"
    t.integer  "fever"
    t.string   "app_type"
    t.string   "apk_path"
    t.string   "version"
    t.string   "small_sdk"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
