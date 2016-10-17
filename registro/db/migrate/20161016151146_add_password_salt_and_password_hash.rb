class AddPasswordSaltAndPasswordHash < ActiveRecord::Migration
  def change
    add_column :alunno, :password_salt, :string
    add_column :alunno, :password_hash, :string
    
    add_column :docenza, :password_salt, :string
    add_column :docenza, :password_hash, :string
    
    add_column :amministrazione, :password_salt, :string
    add_column :amministrazione, :password_hash, :string
  end
end
