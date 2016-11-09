FactoryGirl.define do
  factory :sezione do |f|
    f.lettera "A"
    f.numero 1
  end

  factory :sezione2, class:Sezione do |f|
    f.lettera "A"
    
  end

  factory :sezione3, class:Sezione do |f|
    f.numero 1
    
  end

end
