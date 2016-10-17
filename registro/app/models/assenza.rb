class Assenza < ActiveRecord::Base

   validates :data, presence: true

   belongs_to :alunno
   belongs_to :amministrazione

end
