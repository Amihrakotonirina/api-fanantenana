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

ActiveRecord::Schema.define(version: 2023_01_12_174209) do

  create_table "categorie_reunions", force: :cascade do |t|
    t.string "categorie"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "membre_fanantenanas", force: :cascade do |t|
    t.string "matricule", limit: 20
    t.string "nom", limit: 255
    t.string "prenom", limit: 255
    t.string "sexe", limit: 10
    t.date "date_naissance"
    t.string "adresse", limit: 255
    t.string "telephone", limit: 50
    t.string "photo_profile"
    t.string "telephone_parent", limit: 50
    t.integer "niveau_etude"
    t.integer "annee_etude"
    t.string "profession", limit: 50
    t.date "date_adhesion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "compte_facebook"
    t.string "don", limit: 50
    t.string "etude"
    t.integer "annee_adhesion"
    t.integer "numero_fpvm"
    t.string "status_fpvm", limit: 30
    t.boolean "membre_actif", default: true
  end

  create_table "presences", force: :cascade do |t|
    t.boolean "present"
    t.boolean "retard"
    t.time "heureEntree"
    t.time "heureSortie"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "reunion_id", null: false
    t.integer "membre_fanantenana_id", null: false
    t.index ["membre_fanantenana_id"], name: "index_presences_on_membre_fanantenana_id"
    t.index ["reunion_id"], name: "index_presences_on_reunion_id"
  end

  create_table "reunions", force: :cascade do |t|
    t.date "dateReunion"
    t.time "heureDebut"
    t.time "heureFin"
    t.boolean "ouverte"
    t.text "commentaire"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "categorie_reunion_id"
    t.index ["categorie_reunion_id"], name: "index_reunions_on_categorie_reunion_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "presences", "membre_fanantenanas"
  add_foreign_key "presences", "reunions"
  add_foreign_key "reunions", "categorie_reunions"
end
