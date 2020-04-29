# frozen_string_literal: true

FactoryBot.define do
  factory :apartment_image do
    position { 1 }
    image { 'MyString' }
    apartment { 'MyString' }
  end
end
