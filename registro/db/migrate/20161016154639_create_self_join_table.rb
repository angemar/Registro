class CreateSelfJoinTable < ActiveRecord::Migration
  def change
    create_table :alunno_attivitaextra, id: false do |t|
      t.integer :alunno_id
      t.integer :attivitaextra_id
    end
 
    add_index :alunno_attivitaextra, :alunno_id
    add_index :alunno_attivitaextra, :attivitaextra_id
 
  end
end
