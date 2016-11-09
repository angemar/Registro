FactoryGirl.define do
  factory :materia do |f|
    f.nome "John"
  end

  factory :materia2, class:Materia do |f|
  end

end
