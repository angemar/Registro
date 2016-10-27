class Compito < ActiveRecord::Base

   validates :data, presence: true
   validates :oggetto, presence: true

   belongs_to :docenza
   has_many :alunno_compito
   has_many :alunni, :through => :alunno_compito
   belongs_to :materia
   belongs_to :sezione
end
