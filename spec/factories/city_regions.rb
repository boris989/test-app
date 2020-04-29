# frozen_string_literal: true

FactoryBot.define do
  sequence :city_region_name do |i|
    "name#{i}"
  end

  factory :city_region do
    name { generate(:city_region_name) }
  end
end
