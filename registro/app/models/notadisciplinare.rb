class Notadisciplinare < ActiveRecord::Base

   validates :data, presence: true

   belongs_to :docente
   has_and_belongs_to_many :alunni
end
