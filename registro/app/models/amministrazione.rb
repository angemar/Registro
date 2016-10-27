class Amministrazione < ActiveRecord::Base

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
   validates :titolo, presence: true
   validates :email, presence: true, uniqueness: true, email: true
   validates :password, presence: true
   validates :password_confirmation, presence: true
   validates_confirmation_of :password

   has_many :circolari
   has_many :assenze



   def encrypt_password
     if password.present?
       self.password_salt = BCrypt::Engine.generate_salt
       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
     end
   end

  def self.authenticate(email, password)
    amministrazione = Amministrazione.where("email = ?", email).first
    if amministrazione && amministrazione.password_hash == BCrypt::Engine.hash_secret(password, amministrazione.password_salt)
      amministrazione
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
