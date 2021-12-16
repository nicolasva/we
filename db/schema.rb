# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_06_125341) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.integer "pro_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pro_id"], name: "index_appointments_on_pro_id"
  end

  create_table "booking_prestations", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.integer "prestation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_booking_prestations_on_booking_id"
    t.index ["prestation_id"], name: "index_booking_prestations_on_prestation_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.datetime "starts_at", null: false
    t.text "address", null: false
    t.integer "lat"
    t.integer "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "openning_hours", force: :cascade do |t|
    t.string "day", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.integer "pro_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pro_id"], name: "index_openning_hours_on_pro_id"
  end

  create_table "prestations", force: :cascade do |t|
    t.string "reference", null: false
    t.integer "duration", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pro_prestations", force: :cascade do |t|
    t.integer "pro_id", null: false
    t.integer "prestation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prestation_id"], name: "index_pro_prestations_on_prestation_id"
    t.index ["pro_id"], name: "index_pro_prestations_on_pro_id"
  end

  create_table "pros", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.integer "lat", null: false
    t.integer "lng", null: false
    t.integer "max_kilometers", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "pros"
  add_foreign_key "booking_prestations", "bookings"
  add_foreign_key "booking_prestations", "prestations"
  add_foreign_key "openning_hours", "pros"
  add_foreign_key "pro_prestations", "prestations"
  add_foreign_key "pro_prestations", "pros"
end
