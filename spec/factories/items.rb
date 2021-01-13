FactoryBot.define do
  factory :item do
    name                 { 'たまご' }
    item_info            { '鶏のたまご' }
    price                { 300 }
    category_id { '2' }
    status_id            { '2' }
    shipping_charges_id  { '2' }
    area_id              { '2' }
    date_of_shipment_id  { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
