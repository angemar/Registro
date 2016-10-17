class Amministrazione < ActiveRecord::Base

   validates :cf, presence: true, length: { maximum: 16, minimum: 16 }
   validates :nome, presence: true
   validates :cognome, presence: true
   validates :indirizzo, presence: true
   validates :cittaresidenza, presence: true
   validates :datanascita, presence: true
   validates :cittanascita, presence: true
   validates :titolo, presence: true
   validates :email, presence: true, uniqueness: true, email: true
   validates :password, presence: true
   validates_confirmation_of :email, :password

   has_many :circolari
   has_many :assenze
end
