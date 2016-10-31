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

ActiveRecord::Schema.define(version: 20161030214943) do

  create_table "alunno", force: :cascade do |t|
    t.string   "cf"
    t.string   "nome"
    t.string   "cognome"
    t.string   "indirizzo"
    t.string   "cittaresidenza"
    t.string   "cittanascita"
    t.date     "datanascita"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "sezione_id"
    t.string   "password_salt"
    t.string   "password_hash"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

  add_index "alunno", ["sezione_id"], name: "index_alunno_on_sezione_id"

  create_table "alunno_attivitaextra", force: :cascade do |t|
    t.integer  "alunno_id"
    t.integer  "attivitaextra_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "alunno_attivitaextra", ["alunno_id"], name: "index_alunno_attivitaextra_on_alunno_id"
  add_index "alunno_attivitaextra", ["attivitaextra_id"], name: "index_alunno_attivitaextra_on_attivitaextra_id"

  create_table "amministrazione", force: :cascade do |t|
    t.string   "cf"
    t.string   "nome"
    t.string   "cognome"
    t.string   "indirizzo"
    t.string   "cittaresidenza"
    t.string   "cittanascita"
    t.date     "datanascita"
    t.string   "email"
    t.string   "password"
    t.string   "titolo"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_salt"
    t.string   "password_hash"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

  create_table "assenza", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "alunno_id"
    t.integer  "amministrazione_id"
  end

  add_index "assenza", ["alunno_id"], name: "index_assenza_on_alunno_id"
  add_index "assenza", ["amministrazione_id"], name: "index_assenza_on_amministrazione_id"

  create_table "attivitaextra", force: :cascade do |t|
    t.text     "descrizione"
    t.date     "datainizio"
    t.date     "datafine"
    t.string   "luogo"
    t.time     "orainizio"
    t.time     "orafine"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "docenza_id"
    t.integer  "sezione_id"
  end

  add_index "attivitaextra", ["docenza_id"], name: "index_attivitaextra_on_docenza_id"
  add_index "attivitaextra", ["sezione_id"], name: "index_attivitaextra_on_sezione_id"

  create_table "circolare", force: :cascade do |t|
    t.integer  "numero"
    t.date     "dataemissione"
    t.string   "titolo"
    t.text     "oggetto"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "amministrazione_id"
  end

  add_index "circolare", ["amministrazione_id"], name: "index_circolare_on_amministrazione_id"

  create_table "compito", force: :cascade do |t|
    t.date     "data"
    t.text     "oggetto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "docenza_id"
    t.integer  "materia_id"
    t.integer  "sezione_id"
  end

  add_index "compito", ["docenza_id"], name: "index_compito_on_docenza_id"
  add_index "compito", ["materia_id"], name: "index_compito_on_materia_id"
  add_index "compito", ["sezione_id"], name: "index_compito_on_sezione_id"

  create_table "docenza", force: :cascade do |t|
    t.string   "cf"
    t.string   "nome"
    t.string   "cognome"
    t.string   "indirizzo"
    t.string   "cittaresidenza"
    t.string   "cittanascita"
    t.date     "datanascita"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_salt"
    t.string   "password_hash"
    t.text     "curriculum"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

  create_table "docenza_sezione_materia", force: :cascade do |t|
    t.integer  "sezione_id"
    t.integer  "docenza_id"
    t.integer  "materia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "docenza_sezione_materia", ["docenza_id"], name: "index_docenza_sezione_materia_on_docenza_id"
  add_index "docenza_sezione_materia", ["materia_id"], name: "index_docenza_sezione_materia_on_materia_id"
  add_index "docenza_sezione_materia", ["sezione_id"], name: "index_docenza_sezione_materia_on_sezione_id"

  create_table "materia", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notadisciplinare", force: :cascade do |t|
    t.date     "data"
    t.text     "oggetto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "docenza_id"
    t.integer  "alunno_id"
  end

  add_index "notadisciplinare", ["alunno_id"], name: "index_notadisciplinare_on_alunno_id"
  add_index "notadisciplinare", ["docenza_id"], name: "index_notadisciplinare_on_docenza_id"

  create_table "sezione", force: :cascade do |t|
    t.string   "lettera"
    t.integer  "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "voto", force: :cascade do |t|
    t.date     "data"
    t.integer  "valore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "docenza_id"
    t.integer  "materia_id"
    t.integer  "alunno_id"
  end

  add_index "voto", ["alunno_id"], name: "index_voto_on_alunno_id"
  add_index "voto", ["docenza_id"], name: "index_voto_on_docenza_id"
  add_index "voto", ["materia_id"], name: "index_voto_on_materia_id"

end
