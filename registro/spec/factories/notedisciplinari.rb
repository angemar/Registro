FactoryGirl.define do
  factory :notadisciplinare do |f|
    f.data "12/02/2016"
    f.oggetto "L'alunno ha..."
  end
  
  factory :notadisciplinare2, class:Notadisciplinare do |f|
    f.data "12/02/2016"
  end


factory :notadisciplinare3, class:Notadisciplinare do |f|
    f.oggetto "L'alunno ha..."
  end

end
