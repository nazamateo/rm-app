FactoryBot.define do
  factory :user do
    
    trait :admin_email_role do
      email { Faker::Internet.email(name: "admin") }
      service {'genserve'}
      unit {'engineering'}
      password { "adminpassword" }
      password_confirmation { "adminpassword" }
      role { 0 }
    end
    
    trait :requestor_email_role do
      email { Faker::Internet.email(name: "requestor") }
      service {'genserve'}
      unit {'engineering'}
      password { "requestorpassword" }
      password_confirmation { "requestorpassword" }
      role { 1 }
    end

    factory :admin, traits: %i[admin_email_role]
    factory :requestor, traits: %i[requestor_email_role]
  end
end
