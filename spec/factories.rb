FactoryBot.define do
    factory :service do
        name { FFaker::Company.name }
        description { FFaker::Lorem.paragraph }
        url { FFaker::Internet.http_url }
        email { FFaker::Internet.email }
        phone { FFaker::PhoneNumber.phone_number }
    end

    factory :category do
        name { FFaker::Lorem.word }
    end
end