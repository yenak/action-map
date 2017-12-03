FactoryBot.define do
  factory :person, class: Person do
    trait :obama do
      name         "Barack Obama"
      sex          "Male"
      birthday     Date.parse("1961-04-08")
      description  "44th President"
      phone_number "1-800-333-3333"
      email        "bobama@gmail.com"
    end
  end
end