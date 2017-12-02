FactoryBot.define do
  factory :user, class: User do
    trait :obama do
      name         "Barack Obama"
      uid          "123456"
      provider     "google"
      email        "bobama@gmail.com"
      interests    ""
    end
  end
end