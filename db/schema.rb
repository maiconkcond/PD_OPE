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

ActiveRecord::Schema.define(version: 20151108214718) do

  create_table "clients", force: :cascade do |t|
    t.string   "nome",        limit: 255
    t.string   "endereco",    limit: 255
    t.string   "complemento", limit: 255
    t.string   "bairro",      limit: 255
    t.string   "cidade",      limit: 255
    t.string   "cep",         limit: 255
    t.string   "tel1",        limit: 255
    t.string   "tel2",        limit: 255
    t.string   "cel1",        limit: 255
    t.string   "cel2",        limit: 255
    t.string   "email",       limit: 255
    t.text     "obs",         limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "estoques", force: :cascade do |t|
    t.string   "nome",             limit: 255
    t.integer  "quantidade",       limit: 4
    t.integer  "fabricante_id",    limit: 4
    t.integer  "fornecedor_id",    limit: 4
    t.integer  "grupo_estoque_id", limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.decimal  "qtd_minima",                     precision: 10
    t.text     "cod_barras",       limit: 65535
    t.decimal  "valor_custo",                    precision: 10
    t.decimal  "margem_lucro",                   precision: 10
    t.decimal  "valor_venda",                    precision: 10
    t.text     "obs",              limit: 65535
    t.string   "insumo2",          limit: 255
    t.string   "insumo1",          limit: 255
    t.string   "insumo3",          limit: 255
    t.string   "insumo4",          limit: 255
    t.string   "insumo5",          limit: 255
    t.string   "insumo6",          limit: 255
    t.string   "insumo7",          limit: 255
    t.string   "insumo8",          limit: 255
    t.decimal  "qtd_insumo1",                    precision: 10
    t.decimal  "qtd_insumo2",                    precision: 10
    t.decimal  "qtd_insumo3",                    precision: 10
    t.decimal  "qtd_insumo4",                    precision: 10
    t.decimal  "qtd_insumo5",                    precision: 10
    t.decimal  "qtd_insumo6",                    precision: 10
    t.decimal  "qtd_insumo7",                    precision: 10
    t.decimal  "qtd_insumo8",                    precision: 10
    t.string   "med_ins1",         limit: 255
    t.string   "med_ins2",         limit: 255
    t.string   "med_ins3",         limit: 255
    t.string   "med_ins4",         limit: 255
    t.string   "med_ins5",         limit: 255
    t.string   "med_ins6",         limit: 255
    t.string   "med_ins7",         limit: 255
    t.string   "med_ins8",         limit: 255
    t.string   "unid_medida",      limit: 255
  end

  add_index "estoques", ["fabricante_id"], name: "index_estoques_on_fabricante_id", using: :btree
  add_index "estoques", ["fornecedor_id"], name: "index_estoques_on_fornecedor_id", using: :btree
  add_index "estoques", ["grupo_estoque_id"], name: "index_estoques_on_grupo_estoque_id", using: :btree

  create_table "fabricantes", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "tel1",       limit: 255
    t.string   "tel2",       limit: 255
    t.string   "tel3",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string   "razao_social",  limit: 255
    t.string   "nome_fantasia", limit: 255
    t.string   "endereco",      limit: 255
    t.string   "bairro",        limit: 255
    t.string   "cep",           limit: 255
    t.string   "cidade",        limit: 255
    t.string   "tel1",          limit: 255
    t.string   "tel2",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "cargo",      limit: 255
    t.string   "salario",    limit: 255
    t.string   "comissao",   limit: 255
    t.string   "endereco",   limit: 255
    t.string   "cep",        limit: 255
    t.string   "tel",        limit: 255
    t.string   "cel",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "grupo_estoques", force: :cascade do |t|
    t.string   "nome",           limit: 255
    t.string   "descricao_loga", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "insumos", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.decimal  "quantidade",             precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "unid_med",   limit: 255
  end

  create_table "itens_pedidos", force: :cascade do |t|
    t.integer  "estoque_id",       limit: 4
    t.integer  "pedido_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "grupo_estoque_id", limit: 4
  end

  add_index "itens_pedidos", ["estoque_id"], name: "index_itens_pedidos_on_estoque_id", using: :btree
  add_index "itens_pedidos", ["pedido_id"], name: "index_itens_pedidos_on_pedido_id", using: :btree

  create_table "pedidos", force: :cascade do |t|
    t.integer  "client_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "status",     limit: 4
  end

  add_index "pedidos", ["client_id"], name: "index_pedidos_on_client_id", using: :btree

  create_table "unid_meds", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.text     "abreviacao", limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "role",                   limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "estoques", "fabricantes"
  add_foreign_key "estoques", "fornecedors"
  add_foreign_key "estoques", "grupo_estoques"
  add_foreign_key "itens_pedidos", "estoques"
  add_foreign_key "itens_pedidos", "pedidos"
  add_foreign_key "pedidos", "clients"
end
