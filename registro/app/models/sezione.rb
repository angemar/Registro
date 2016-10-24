class Sezione < ActiveRecord::Base

   validates :lettera, presence: true
   validates :numero, presence: true

   has_many :alunni
   has_many :compiti
   has_many :docenze, :through => :docenza_sezione_materia
   has_many :materie, :through => :docenza_sezione_materia
end
