class CreateAlunnoAttivitaextra < ActiveRecord::Migration
  def change
    create_table :alunno_attivitaextra do |t|
      t.integer :alunno_id
      t.integer :attivitaextra_id

      t.timestamps null: false
    end

  add_index "alunno_attivitaextra", ["alunno_id"], name: "index_alunno_attivitaextra_on_alunno_id"
  add_index "alunno_attivitaextra", ["attivitaextra_id"], name: "index_alunno_attivitaextra_on_attivitaextra_id"
  end
end
