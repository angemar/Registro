class AddCurriculum < ActiveRecord::Migration
  def change
     add_column :docenza, :curriculum, :text
  end
end
