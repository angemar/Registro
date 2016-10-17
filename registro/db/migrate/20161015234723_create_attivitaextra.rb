class CreateAttivitaextra < ActiveRecord::Migration
  def change
    create_table :attivitaextra do |t|
      t.text :descrizione
      t.date :datainizio
      t.date :datafine
      t.string :luogo
      t.time :orainizio
      t.time :orafine

      t.timestamps null: false
    end
  end
end
