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

ActiveRecord::Schema[7.0].define(version: 2022_05_04_225857) do
  create_table "assignment2s", force: :cascade do |t|
    t.string "assignmentname"
    t.string "totalpoints"
    t.string "course2s"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "courseid"
  end

  create_table "assignments", force: :cascade do |t|
    t.text "assignmentname"
    t.text "totalpoints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course2s", force: :cascade do |t|
    t.string "course_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coursestudent2s", force: :cascade do |t|
    t.integer "course2s_id", null: false
    t.integer "students_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course2s_id"], name: "index_coursestudent2s_on_course2s_id"
    t.index ["students_id"], name: "index_coursestudent2s_on_students_id"
  end

  create_table "coursestudents", force: :cascade do |t|
    t.string "fullname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.integer "course2_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course2_id"], name: "index_rosters_on_course2_id"
    t.index ["student_id"], name: "index_rosters_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coursestudent2s", "course2s", column: "course2s_id"
  add_foreign_key "coursestudent2s", "students", column: "students_id"
  add_foreign_key "rosters", "course2s"
  add_foreign_key "rosters", "students"
end
