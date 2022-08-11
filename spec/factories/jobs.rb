FactoryBot.define do
  factory :job do
    association :user, factory: :requestor
    nature_of_request { "Renovation of engineering office" }
    note_to_staff { "Deadline Dec 2022" }

    trait :not_yet_assigned do
    end

    trait :assigned do
    association :assessor_id, factory: :engineer
    association :staff_id, factory: :staff
    end

    factory :newly_created, traits: %i[not_yet_assigned]
    factory :ongoing, traits: %i[assigned]
    factory :done, traits: %i[assigned]
    factory :cancelled, traits: %i[assigned]
  end
end
