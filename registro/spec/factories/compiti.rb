FactoryGirl.define do
  factory :compito do |f|
    f.data "12/02/2016"
    f.oggetto "Test di inglese"
  end

  factory :compito2, class:Compito do |f|
    f.data "12/02/2016"
  end

factory :compito3, class:Compito do |f|
    f.oggetto "Test di inglese"
  end

end
