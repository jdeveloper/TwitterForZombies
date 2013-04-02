FactoryGirl.define do
  factory :weapon do
    name "Broadsword"
    association :zombie
  end
end