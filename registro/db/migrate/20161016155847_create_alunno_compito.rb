class CreateAlunnoCompito < ActiveRecord::Migration
  def change
    create_table :alunno_compito, id: false do |t|
      t.integer :voto
      t.integer :alunno_id
      t.integer :compito_id
    end

   add_index "alunno_compito", ["alunno_id"], name: "index_alunno_compito_on_alunno_id"
   add_index "alunno_compito", ["compito_id"], name: "index_alunno_compito_on_compito_id"
  end
end
