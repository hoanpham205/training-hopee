# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_231_116_095_759) do
  create_table 'accounts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'assemblies', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'assemblies_parts', id: false, charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci',
                                   force: :cascade do |t|
    t.bigint 'assembly_id', null: false
    t.bigint 'part_id', null: false
    t.index ['assembly_id'], name: 'index_assemblies_parts_on_assembly_id'
    t.index ['part_id'], name: 'index_assemblies_parts_on_part_id'
  end

  create_table 'coffees', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'size'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'comments', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'commentable_id'
  end

  create_table 'parts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'people', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.boolean 'sex'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email'
  end

  create_table 'photos', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pictures', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'accounts_id'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['accounts_id'], name: 'index_pictures_on_accounts_id'
  end

  create_table 'posts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'title'
    t.string 'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'products', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.decimal 'price', precision: 10
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reviews', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'content'
    t.integer 'reviewable_id'
    t.string 'reviewable_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
