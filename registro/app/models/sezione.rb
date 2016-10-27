class Sezione < ActiveRecord::Base

   validates :lettera, presence: true
   validates :numero, presence: true

   has_many :alunni
   has_many :compiti
   has_and_belongs_to_many :docenze, :join_table => "docenza_sezione_materia"
   has_and_belongs_to_many :materie, :join_table => "docenza_sezione_materia"
end
