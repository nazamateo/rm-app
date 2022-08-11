FactoryBot.define do
  factory :evaluation do

    trait :very_good do
        response_time {3}
        quality {4}
        courtesy {5}
        association :job, factory: :done
    end
    
    factory :good, traits: %i[very_good]
  end
end
