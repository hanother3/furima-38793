FactoryBot.define do
  factory :shopping_shipping_address do
    postal_code          { '123-4567' }
    area_id              { 2 }
    city                 { '練馬区' }
    house_number         { '1-1' }
    building_name        { '東京ハイツ' }
    phone_number         { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end