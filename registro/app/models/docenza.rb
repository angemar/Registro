class Docenza < ActiveRecord::Base

   validates :cf, presence: true, length: { maximum: 16, minimum: 16 }
   validates :nome, presence: true
   validates :cognome, presence: true
   validates :indirizzo, presence: true
   validates :cittaresidenza, presence: true
   validates :datanascita, presence: true
   validates :cittanascita, presence: true
   validates :email, presence: true, uniqueness: true, email: true
   validates :password, presence: true
   validates_confirmation_of :email, :password

   has_and_belongs_to_many :attivitaextras
   has_many :notedisciplinari
   has_many :compiti
   has_many :materie, :through => 'docenza_sezione_materia'
   has_many :sezioni, :through => 'docenza_sezione_materia'
   has_many :voti
end
