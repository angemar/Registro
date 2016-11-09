FactoryGirl.define do
  factory :assenza do |f|
    f.date "12/12/1990"
  end

  factory :assenza2, class:Assenza do |f|

  end

end
