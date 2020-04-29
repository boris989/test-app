# frozen_string_literal: true

module Admin::Apartment::Operation
  class Update < Trailblazer::Operation
    step Model(Apartment, :find)
    step Contract::Build(constant: Admin::Apartment::Contract::Create)
    step Contract::Validate(key: :apartment)
    step Contract::Persist()
  end
end
