class Compito < ActiveRecord::Base

   validates :data, presence: true
   validates :oggetto, presence: true

   belongs_to :docenza
   has_many :alunni, :through => :alunni_compiti
   belongs_to :materia
   belongs_to :sezione
end
