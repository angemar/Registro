class Assenza < ActiveRecord::Base

   validates :date, presence: true

   belongs_to :alunno
   belongs_to :amministrazione

end
