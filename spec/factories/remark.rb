FactoryBot.define do
  factory :remark do

    trait :remark_ongoing do
        status {'Ongoing'}
        remarks {'n.a'}
        association :job, factory: :ongoing
    end
    
    trait :remark_done do
        status {'Done'}
        remarks {'n.a'}
        association :job, factory: :done
    end
    
    trait :remark_cancelled do
        status {'Cancelled'}
        remarks {'n.a'}
        association :job, factory: :cancelled
    end

    factory :remark_ongoing, traits: %i[remark_ongoing]
    factory :remark_done, traits: %i[remark_done]
    factory :remark_cancelled, traits: %i[remark_cancelled]

  end
end
