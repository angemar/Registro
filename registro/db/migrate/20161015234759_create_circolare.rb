class CreateCircolare < ActiveRecord::Migration
  def change
    create_table :circolare do |t|
      t.integer :numero
      t.date :dataemissione
      t.string :titolo
      t.text :oggetto

      t.timestamps null: false
    end
  end
end
