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

ActiveRecord::Schema.define(version: 20170606144519) do

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "leido",                            default: 0
    t.text     "cuerpo",             limit: 65535
    t.boolean  "para_administrador"
    t.integer  "presentation_id"
    t.integer  "session_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["presentation_id"], name: "index_notifications_on_presentation_id", using: :btree
    t.index ["session_id"], name: "index_notifications_on_session_id", using: :btree
  end

  create_table "participations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "identificador"
    t.string   "fuente"
    t.string   "formato"
    t.string   "titulo"
    t.string   "autor"
    t.string   "coautor1"
    t.string   "coautor2"
    t.string   "coautor3"
    t.string   "coautor4"
    t.string   "coautor5"
    t.string   "institucion"
    t.text     "introduccion",       limit: 65535
    t.text     "objetivos",          limit: 65535
    t.text     "metodologia",        limit: 65535
    t.text     "resultados",         limit: 65535
    t.text     "conclusiones",       limit: 65535
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "img1a_file_name"
    t.string   "img1a_content_type"
    t.integer  "img1a_file_size"
    t.datetime "img1a_updated_at"
    t.string   "img1b_file_name"
    t.string   "img1b_content_type"
    t.integer  "img1b_file_size"
    t.datetime "img1b_updated_at"
    t.string   "img2_file_name"
    t.string   "img2_content_type"
    t.integer  "img2_file_size"
    t.datetime "img2_updated_at"
    t.boolean  "finalizado",                       default: false
    t.integer  "session_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["session_id"], name: "index_posters_on_session_id", using: :btree
  end

  create_table "presentations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "titulo"
    t.string   "estado"
    t.integer  "session_id"
    t.integer  "state_id",             default: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "resumen_file_name"
    t.string   "resumen_content_type"
    t.integer  "resumen_file_size"
    t.datetime "resumen_updated_at"
    t.string   "trabajo_file_name"
    t.string   "trabajo_content_type"
    t.integer  "trabajo_file_size"
    t.datetime "trabajo_updated_at"
    t.index ["session_id"], name: "index_presentations_on_session_id", using: :btree
    t.index ["state_id"], name: "index_presentations_on_state_id", using: :btree
  end

  create_table "sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "tipo_dni"
    t.string   "dni"
    t.string   "telefono"
    t.integer  "tipo_participacion"
    t.integer  "authors_id"
    t.integer  "tipo_institucion"
    t.string   "institucion"
    t.integer  "rol",                    default: 1
    t.integer  "poster_id"
    t.integer  "presentation_id"
    t.index ["authors_id"], name: "index_users_on_authors_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["poster_id"], name: "index_users_on_poster_id", using: :btree
    t.index ["presentation_id"], name: "index_users_on_presentation_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "notifications", "presentations"
  add_foreign_key "notifications", "sessions"
  add_foreign_key "posters", "sessions"
  add_foreign_key "presentations", "sessions"
  add_foreign_key "presentations", "states"
end
