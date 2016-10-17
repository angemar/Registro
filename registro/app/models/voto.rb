class Voto < ActiveRecord::Base

   validates :data, presence: true
   validates :valore, presence: true

   belongs_to :docenza
   belongs_to :materia
   belongs_to :alunno
end
