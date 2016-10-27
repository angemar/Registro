class AddEmailConfirmation < ActiveRecord::Migration
  def change
    add_column :alunno, :email_confirmed, :boolean, :default => false
    add_column :alunno, :confirm_token, :string

    add_column :docenza, :email_confirmed, :boolean, :default => false
    add_column :docenza, :confirm_token, :string

    add_column :amministrazione, :email_confirmed, :boolean, :default => false
    add_column :amministrazione, :confirm_token, :string

  end
end
