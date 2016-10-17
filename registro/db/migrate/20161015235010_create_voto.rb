class CreateVoto < ActiveRecord::Migration
  def change
    create_table :voto do |t|
      t.date :data
      t.integer :valore

      t.timestamps null: false
    end
  end
end
