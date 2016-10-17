class Circolare < ActiveRecord::Base

   validates :titolo, presence: true
   validates :numero, presence: true
   validates :dataemissione, presence: true

   belongs_to :amministrazione
end
