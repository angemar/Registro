class CreateCompito < ActiveRecord::Migration
  def change
    create_table :compito do |t|
      t.date :data
      t.text :oggetto

      t.timestamps null: false
    end
  end
end
