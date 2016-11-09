FactoryGirl.define do
  factory :docenza do |f|
    f.cf "AAAAAAAAAAAAAAAA"
    f.nome "John"
    f.cognome "Doe"
    f.indirizzo "via roma 10"
    f.cittaresidenza "Roma"
    f.cittanascita "Roma"
    f.email "a@gmail.com"
    f.datanascita "12/12/1990"
    f.password "aa"
    f.password_confirmation "aa"
  end

  factory :docenza2, class:Docenza do |f|
    f.cf "AAAAAAA"
    f.nome "John"
    f.cognome "Doe"
    f.indirizzo "via roma 10"
    f.cittaresidenza "Roma"
    f.cittanascita "Roma"
    f.email "a@gmail.com"
    f.datanascita "12/12/1990"
    f.password "aa"
    f.password_confirmation "aa"
  end

factory :docenza3, class:Docenza do |f|
    f.cf "AAAAAAAAAAAAAAAA"
    f.cognome "Doe"
    f.indirizzo "via roma 10"
    f.cittaresidenza "Roma"
    f.cittanascita "Roma"
    f.email "a@gmail.com"
    f.datanascita "12/12/1990"
    f.password "aa"
    f.password_confirmation "aa"
  end
end
