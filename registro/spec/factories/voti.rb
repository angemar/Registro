FactoryGirl.define do
  factory :voto do |f|
    f.data "12/02/2016"
    f.valore 8
  end

  factory :voto2, class:Voto do |f|
    f.data "12/02/2016"
  end

factory :voto3, class:Voto do |f|
    f.valore 8
  end

end
