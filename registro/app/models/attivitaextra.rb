class Attivitaextra < ActiveRecord::Base

   validates :datainizio, presence: true
   validates :datafine, presence: true
   validates :luogo, presence: true

   has_many :docenze, :through => :docenza_attivitaextra
   has_and_belongs_to_many :alunni
end
