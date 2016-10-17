class CreateMateria < ActiveRecord::Migration
  def change
    create_table :materia do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
