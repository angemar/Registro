class CreateAssenza < ActiveRecord::Migration
  def change
    create_table :assenza do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
