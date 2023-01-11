FactoryBot.define do
  factory :item do

    item_name              { Faker::Commerce.product_name }
    item_description       { Faker::Company.catch_phrase }
    price                  { Faker::Number.within(range: 300..9999999) }
    category_id            { 2 }
    item_condition_id      { 2 }
    delivery_charge_id     { 2 }
    area_id                { 2 }
    delivery_time_id       { 2 }
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
