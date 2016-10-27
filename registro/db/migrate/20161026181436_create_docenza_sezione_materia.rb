class CreateDocenzaSezioneMateria < ActiveRecord::Migration
  def change
    create_table :docenza_sezione_materia do |t|
      t.integer :sezione_id
      t.integer :docenza_id
      t.integer :materia_id

      t.timestamps null: false
    end
    
    add_index :docenza_sezione_materia, :docenza_id
    add_index :docenza_sezione_materia, :sezione_id
    add_index :docenza_sezione_materia, :materia_id
  end
end
