# frozen_string_literal: true

class CityRegionSerializer < ActiveModel::Serializer
  attributes :id, :name
end

# == Schema Information
#
# Table name: city_regions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
