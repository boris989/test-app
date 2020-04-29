# frozen_string_literal: true

module Admin::Apartment::Operation
  class Show < Trailblazer::Operation
    step Model(Apartment, :find)
  end
end
