class Docenza < ActiveRecord::Base

   attr_accessor :password
   before_save :encrypt_password
   before_create :confirmation_token

   validates :cf, presence: true, length: { maximum: 16, minimum: 16 }
   validates :nome, presence: true
   validates :cognome, presence: true
   validates :indirizzo, presence: true
   validates :cittaresidenza, presence: true
   validates :datanascita, presence: true
   validates :cittanascita, presence: true
   validates :email, presence: true, uniqueness: true, email: true
   validates :password, presence: true
   validates_confirmation_of :password

   has_many :docenza_attivitaextra
   has_and_belongs_to_many :attivitaextras, :join_table => "docenza_attivitaextra"
   has_many :notedisciplinari
   has_many :compiti
   has_many :voti
   has_and_belongs_to_many :sezioni, :join_table => "docenza_sezione_materia"
   has_and_belongs_to_many :materie, :join_table => "docenza_sezione_materia"


   def encrypt_password
     if password.present?
       self.password_salt = BCrypt::Engine.generate_salt
       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
     end
   end

  def self.authenticate(email, password)
    docenza = Docenza.where("email = ?", email).first
    if docenza && docenza.password_hash == BCrypt::Engine.hash_secret(password, docenza.password_salt)
      docenza
    else 
      nil
    end
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
  def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
  end



end
