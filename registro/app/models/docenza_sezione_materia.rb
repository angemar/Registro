class DocenzaSezioneMateria < ActiveRecord::Base
  belongs_to :docenza
  belongs_to :sezione
  belongs_to :materia
end
