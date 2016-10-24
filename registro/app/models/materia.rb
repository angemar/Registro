class Materia < ActiveRecord::Base

   validates :nome, presence: true

   has_many :docenze, :through => :docenza_sezione_materia
   has_many :sezioni, :through => :docenza_sezione_materia
   has_many :compiti
   has_many :voti
end
