# frozen_string_literal: true

class ActiveModel::Errors
  def as_json(_options = {})
    to_hash(true).map { |key, value| { field: key, errors: value.join(', ') } }
  end
end
