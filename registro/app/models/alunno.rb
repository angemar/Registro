class Alunno < ActiveRecord::Base

   attr_accessor :password
   before_save :encrypt_password
   before_create :confirmation_token

   validates :cf, presence: true, length: { maximum: 16, minimum: 16 }, :uniqueness => true
   validates :nome, presence: true
   validates :cognome, presence: true
   validates :indirizzo, presence: true
   validates :cittaresidenza, presence: true
   validates :datanascita, presence: true
   validates :cittanascita, presence: true
   validates :email, presence: true, uniqueness: true, email: true
   validates :password, presence: true
   validates :password_confirmation, presence: true
   validates_confirmation_of :password

   belongs_to :sezione
   has_many :alunno_attivitaextra
   has_and_belongs_to_many :attivitaextras, :join_table => "alunno_attivitaextra"
   has_many :voti
   has_many :alunno_compito
   has_many :compiti, :through => :alunno_compito
   has_many :assenze
   has_many :notedisciplinari


   def encrypt_password
     if password.present?
       self.password_salt = BCrypt::Engine.generate_salt
       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
     end
   end

  def self.authenticate(email, password)
    alunno = Alunno.where("email = ?", email).first
    if alunno && alunno.password_hash == BCrypt::Engine.hash_secret(password, alunno.password_salt)
      alunno
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
