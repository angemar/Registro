FactoryGirl.define do
  factory :alunno do |f|
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

  factory :alunno2, class:Alunno do |f|
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

factory :alunno3, class:Alunno do |f|
    f.cf "AAAAAAAAAAAAAAAA"
    f.nome ""
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
