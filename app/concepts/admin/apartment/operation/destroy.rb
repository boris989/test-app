# frozen_string_literal: true

module Admin::Apartment::Operation
  class Destroy < Trailblazer::Operation
    step Model(Apartment, :find)
    step :destroy!

    def destroy!(_options, model:, **)
      model.destroy
    end
  end
end
