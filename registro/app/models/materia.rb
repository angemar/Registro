class Materia < ActiveRecord::Base

   validates :nome, presence: true

   #has_many :docenza_sezione_materia
   #has_many :docenze, :through => :docenza_sezione_materia
   #has_many :sezioni, :through => :docenza_sezione_materia
   has_many :compiti
   has_many :voti
   has_and_belongs_to_many :docenze, :join_table => "docenza_sezione_materia"
   has_and_belongs_to_many :sezioni, :join_table => "docenza_sezione_materia"
end
