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

ActiveRecord::Schema[7.1].define(version: 2024_10_30_165154) do
  create_table "fouls", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_technical", default: false
    t.boolean "active", default: true
    t.integer "sort_order", default: 999
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_fouls_on_name", unique: true
  end

  create_table "games", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.bigint "team_id", null: false
    t.bigint "opponent_id", null: false
    t.datetime "date_time"
    t.integer "number_of_periods", default: 4
    t.boolean "allow_overtime", default: true
    t.integer "period_length", default: 8
    t.integer "overtime_length", default: 4
    t.boolean "is_away", default: false
    t.boolean "is_closed", default: false
    t.json "current_lineup"
    t.boolean "counts_against_record", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opponent_id"], name: "index_games_on_opponent_id"
    t.index ["season_id"], name: "index_games_on_season_id"
    t.index ["team_id"], name: "index_games_on_team_id"
  end

  create_table "periods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "is_overtime", default: false
    t.boolean "active", default: true
    t.integer "sort_order", default: 999
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_periods_on_name", unique: true
  end

  create_table "play_action_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "is_pinned", default: false
    t.boolean "active", default: true
    t.integer "sort_order", default: 99
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_play_action_groups_on_name", unique: true
  end

  create_table "play_actions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "play_action_group_id", null: false
    t.string "name"
    t.integer "points", default: 0
    t.boolean "requires_coordinates", default: false
    t.boolean "requires_fouls", default: false
    t.boolean "requires_substitutions", default: false
    t.string "style"
    t.boolean "active", default: true
    t.integer "sort_order", default: 999
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_action_group_id"], name: "index_play_actions_on_play_action_group_id"
  end

  create_table "players", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "plays", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "period_id", null: false
    t.bigint "team_id", null: false
    t.bigint "play_action_id", null: false
    t.bigint "player_id"
    t.bigint "foul_id"
    t.integer "game_clock"
    t.integer "sort_order"
    t.bigint "shot_grade_id"
    t.bigint "shot_type_id"
    t.decimal "x_coordinate", precision: 16, scale: 10
    t.decimal "y_coordinate", precision: 16, scale: 10
    t.decimal "canvas_height", precision: 16, scale: 10
    t.decimal "canvas_width", precision: 16, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foul_id"], name: "index_plays_on_foul_id"
    t.index ["game_id"], name: "index_plays_on_game_id"
    t.index ["period_id"], name: "index_plays_on_period_id"
    t.index ["play_action_id"], name: "index_plays_on_play_action_id"
    t.index ["player_id"], name: "index_plays_on_player_id"
    t.index ["shot_grade_id"], name: "index_plays_on_shot_grade_id"
    t.index ["shot_type_id"], name: "index_plays_on_shot_type_id"
    t.index ["team_id"], name: "index_plays_on_team_id"
  end

  create_table "season_teams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.bigint "team_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_season_teams_on_season_id"
    t.index ["team_id"], name: "index_season_teams_on_team_id"
  end

  create_table "seasons", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "slug"
    t.date "start_date"
    t.date "end_date"
    t.integer "sort_order", default: 999
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_seasons_on_slug", unique: true
    t.index ["user_id"], name: "index_seasons_on_user_id"
  end

  create_table "shot_grades", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "made_multiplier", precision: 10, scale: 2
    t.decimal "missed_multiplier", precision: 10, scale: 2
    t.integer "score", default: 0
    t.boolean "active", default: true
    t.integer "sort_order", default: 9999
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shot_grades_on_name", unique: true
  end

  create_table "shot_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.integer "sort_order", default: 9999
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shot_types_on_name", unique: true
  end

  create_table "team_levels", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.boolean "active", default: true
    t.integer "sort_order", default: 99
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_team_levels_on_abbreviation", unique: true
    t.index ["name"], name: "index_team_levels_on_name", unique: true
  end

  create_table "teammates", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "season_team_id", null: false
    t.bigint "player_id", null: false
    t.integer "jersey_number"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_teammates_on_player_id"
    t.index ["season_team_id"], name: "index_teammates_on_season_team_id"
  end

  create_table "teams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "locale"
    t.string "abbreviation"
    t.boolean "is_opponent", default: false
    t.string "primary_color"
    t.string "secondary_color"
    t.boolean "active", default: true
    t.integer "sort_order", default: 9999
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_level_id"
    t.string "nickname"
    t.index ["team_level_id"], name: "index_teams_on_team_level_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "seasons"
  add_foreign_key "games", "teams"
  add_foreign_key "games", "teams", column: "opponent_id"
  add_foreign_key "play_actions", "play_action_groups"
  add_foreign_key "players", "users"
  add_foreign_key "plays", "fouls"
  add_foreign_key "plays", "games"
  add_foreign_key "plays", "periods"
  add_foreign_key "plays", "play_actions"
  add_foreign_key "plays", "players"
  add_foreign_key "plays", "shot_grades"
  add_foreign_key "plays", "shot_types"
  add_foreign_key "plays", "teams"
  add_foreign_key "season_teams", "seasons"
  add_foreign_key "season_teams", "teams"
  add_foreign_key "seasons", "users"
  add_foreign_key "teammates", "players"
  add_foreign_key "teammates", "season_teams"
  add_foreign_key "teams", "team_levels"
  add_foreign_key "teams", "users"
end
