FactoryBot.define do
  factory :state, class: State do
    trait :california do
      name                 "CALIFORNIA"
      symbol               "CA"
      activity             0
      immigration_activity 0
      gun_control_activity 0
      environment_activity 0
    end
  end
end