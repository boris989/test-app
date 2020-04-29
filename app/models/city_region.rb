# frozen_string_literal: true

class CityRegion < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  has_many :apartments, dependent: :nullify
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
