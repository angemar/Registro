class Alunno < ActiveRecord::Base

   attr_accessor :password
   attr_accessor :user
   before_save :encrypt_password
   before_create :confirmation_token

   validates :cf, presence: true, length: { maximum: 16, minimum: 16 }, :uniqueness => true
   validates :nome, presence: true
   validates :cognome, presence: true
   validates :indirizzo, presence: true
   validates :cittaresidenza, presence: true
   validates :datanascita, presence: true
   validates :cittanascita, presence: true
   validates :email, presence: true, uniqueness: true, email: true, :on => :create
   validates :password, presence: true, :on => :create
   validates :password_confirmation, presence: true, :on => :create
   validates_confirmation_of :password, :on => :create
   
   validates :email, presence: true, uniqueness: true, email: true, :on => :update, :if => :is_alunno
   validates :password, presence: true, :on => :update, :if => :is_alunno
   validates :password_confirmation, presence: true, :on => :update, :if => :is_alunno
   validates_confirmation_of :password, :on => :update, :if => :is_alunno



   belongs_to :sezione
   has_and_belongs_to_many :attivitaextras, :join_table => "alunno_attivitaextra"
   has_many :voti
   has_many :assenze
   has_many :notedisciplinari  

   def is_alunno
     user=="alunno"
   end

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

  
  def to_label
    "#{cognome} #{nome} #{cf}"
  end

  private
  def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
  end

end
