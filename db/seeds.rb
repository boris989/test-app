# frozen_string_literal: true

10.times do |i|
  FactoryBot.create(:apartment, address: "address #{i}")
end
