FactoryBot.define do
  factory :personnel do

    trait :engineer do
        name {Faker::Name.name}
        surname {Faker::Name.name}
        maintenance_unit {'Engineering'}
        position {'Engineer'}
    end

    trait :personnel_staff do
        name {Faker::Name.name}
        surname {Faker::Name.name}
        maintenance_unit {'Carpentry'}
        position {'Carpenter'}
    end

    factory :engineer, traits: %i[engineer]
    factory :staff, traits: %i[personnel_staff]
  end
end
