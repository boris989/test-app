# frozen_string_literal: true

FactoryBot.define do
  sequence :slug do |i|
    "slug-#{i}"
  end
  factory :apartment do
    address { 'MyString' }
    description { 'MyText' }
    count_rooms { 1 }
    comfort_level { 1 }
    hour_price { '9.99' }
    day_price { '9.99' }
    owner_name { 'MyString' }
    owner_phone { 'MyString' }
    latitude { 1.5 }
    longitude { 1.5 }
    city_region { nil }
    slug { generate(:slug) }
    lead { 'some lead' }
  end
end
