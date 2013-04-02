FactoryGirl.define do
  factory :zombie do
    sequence(:name) { |i| "Ash#{i}" }
    graveyard "Oak Park"
    
    factory :zombie_bill do
      name "Bill"
    end
    
    factory :zombie_mike do
      name "Mike"
      graveyard "Sunnyvale"
    end
  end
  
  factory :armed_zombie, class: Zombie do
    sequence(:name) { |i| "ArmedAsh#{i}" }
    graveyard "Oak Park"
    association :weapon
    association :brain
  end
end