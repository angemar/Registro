class Materia < ActiveRecord::Base

   validates :nome, presence: true, uniqueness: true

   has_many :compiti
   has_many :voti
   has_and_belongs_to_many :docenze, :join_table => "docenza_sezione_materia"
   has_and_belongs_to_many :sezioni, :join_table => "docenza_sezione_materia"
end
