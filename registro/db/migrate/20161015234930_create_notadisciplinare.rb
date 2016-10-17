class CreateNotadisciplinare < ActiveRecord::Migration
  def change
    create_table :notadisciplinare do |t|
      t.date :data
      t.text :oggetto

      t.timestamps null: false
    end
  end
end
