class CreateSezione < ActiveRecord::Migration
  def change
    create_table :sezione do |t|
      t.string :lettera
      t.integer :numero

      t.timestamps null: false
    end
  end
end
