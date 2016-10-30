class Compito < ActiveRecord::Base

   validates :data, presence: true
   validates :oggetto, presence: true

   belongs_to :docenza
   belongs_to :materia
   belongs_to :sezione
end
