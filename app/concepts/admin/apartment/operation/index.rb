# frozen_string_literal: true

module Admin::Apartment::Operation
  class Index < Trailblazer::Operation
    step :models!

    def models!(options, **)
      options['models'] = Apartment.all.order(id: :desc)
    end
  end
end
