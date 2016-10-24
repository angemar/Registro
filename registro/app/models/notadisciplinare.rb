class Notadisciplinare < ActiveRecord::Base

   validates :data, presence: true

   belongs_to :docente
   belongs_to :alunno
end
