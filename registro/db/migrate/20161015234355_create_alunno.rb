class CreateAlunno < ActiveRecord::Migration
  def change
    create_table :alunno do |t|
      t.string :cf
      t.string :nome
      t.string :cognome
      t.string :indirizzo
      t.string :cittaresidenza
      t.string :cittanascita
      t.date :datanascita
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
