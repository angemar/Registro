class DocenzaSezioneMateria < ActiveRecord::Base
   validates_uniqueness_of :sezione_id, :scope => [:materia_id]
   validates_uniqueness_of :materia_id, :scope => [:sezione_id]


  belongs_to :docenza
  belongs_to :sezione
  belongs_to :materia
  
end
