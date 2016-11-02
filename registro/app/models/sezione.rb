class Sezione < ActiveRecord::Base

   validates :lettera, presence: true
   validates :numero, presence: true
   validates_uniqueness_of :lettera, :scope => [:numero]
   validates_uniqueness_of :numero, :scope => [:lettera]

   has_many :alunni, dependent: :destroy
   has_many :attivitaextra, dependent: :destroy
   has_many :compiti, dependent: :destroy
   has_and_belongs_to_many :docenze, :join_table => "docenza_sezione_materia"
   has_and_belongs_to_many :materie, :join_table => "docenza_sezione_materia"
   has_many :docenza_sezione_materia, dependent: :destroy

   def to_label
    "#{numero}#{lettera}"
   end
end
