class Materia < ActiveRecord::Base

   validates :nome, presence: true, uniqueness: true

   has_many :compiti, dependent: :destroy
   has_many :voti, dependent: :destroy
   has_and_belongs_to_many :docenze, :join_table => "docenza_sezione_materia"
   has_and_belongs_to_many :sezioni, :join_table => "docenza_sezione_materia"
   has_many :docenza_sezione_materia, dependent: :destroy
end
