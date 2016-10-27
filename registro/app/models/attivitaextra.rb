class Attivitaextra < ActiveRecord::Base

   validates :datainizio, presence: true
   validates :datafine, presence: true
   validates :luogo, presence: true
   
   has_many :docenza_attivitaextra
   has_and_belongs_to_many :docenze, :join_table => "docenza_attivitaextra"
   has_many :alunno_attivitaextra
   has_and_belongs_to_many :alunni, :join_table => "alunno_attivitaextra"
end
