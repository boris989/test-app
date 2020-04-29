# frozen_string_literal: true

module Admin::Apartment::Operation
  class Create < Trailblazer::Operation
    step Model(::Apartment, :new)
    step Contract::Build(constant: Admin::Apartment::Contract::Create)
    step Contract::Validate(key: :apartment)
    step Contract::Persist()
  end
end
