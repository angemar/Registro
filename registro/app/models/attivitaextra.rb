class Attivitaextra < ActiveRecord::Base

   validates :dataininzio, presence: true
   validates :datafine, presence: true
   validates :luogo, presence: true

   has_and_belongs_to_many :docenze
   has_and_belongs_to_many :alunni
end
