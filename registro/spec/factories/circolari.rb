FactoryGirl.define do
  factory :circolare do |f|
    f.numero 3231
    f.dataemissione "12/03/2016"
    f.titolo "Sciopero"
    f.oggetto "Si comunica che..."    
  end

  factory :circolare2, class:Circolare do |f|
    f.numero 3231
    f.dataemissione "12/03/2016"
    f.oggetto "Si comunica che..."
  end

end
