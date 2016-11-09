FactoryGirl.define do
  factory :attivitaextra do |f|
    f.descrizione "Corso di Recupero"
    f.datainizio "12/06/2015"
    f.datafine "12/07/2015"
    f.luogo "via roma 10"
  end

  factory :attivitaextra2, class:Attivitaextra do |f|
    f.descrizione "Corso di Recupero"
    f.datainizio "12/06/2015"
    f.datafine "12/07/2015"
  end

  factory :attivitaextra3, class:Attivitaextra do |f|
    f.descrizione "Corso di Recupero"
    f.luogo "via roma 10"
  end


end
