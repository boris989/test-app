# frozen_string_literal: true

FactoryBot.define do
  factory :token do
    admin_user { nil }
    value { 'MyString' }
  end
end
