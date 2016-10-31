class AlunnoAttivitaextra < ActiveRecord::Base
   validates_uniqueness_of :alunno_id, :scope => [:attivitaextra_id]
   validates_uniqueness_of :attivitaextra_id, :scope => [:alunno_id]


  belongs_to :alunno
  belongs_to :attivitaextra
 
end
