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

ActiveRecord::Schema.define(version: 2023_06_07_055403) do

  create_table "buses", force: :cascade do |t|
    t.integer "bus_number"
    t.string "departure_city"
    t.string "destination_city"
    t.datetime "departure"
    t.datetime "arrival"
    t.integer "available_seats"
    t.integer "fare"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "passport"
    t.integer "phone_number"
    t.string "mode_of_payment"
    t.string "departure_info"
    t.integer "bus_number_id"
    t.integer "train_number_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "reviews"
  end

  create_table "trains", force: :cascade do |t|
    t.integer "train_number"
    t.string "departure_city"
    t.string "destination_city"
    t.datetime "departure"
    t.datetime "arrival"
    t.integer "available_seats"
    t.integer "fare"
  end

end
