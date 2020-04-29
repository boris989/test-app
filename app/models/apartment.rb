# frozen_string_literal: true

class Apartment < ApplicationRecord
  belongs_to :city_region, optional: true
  has_many :images, class_name: 'ApartmentImage', dependent: :destroy

  enum comfort_level: { standard: 0, comfort: 1, lux: 2 }

  scope :removed, -> { where(removed: true) }
  scope :not_removed, -> { where(removed: false) }

  def comfort_level_human
    case comfort_level
    when 'standard'
      'Стандарт'
    when 'comfort'
      'Комфорт'
    when 'lux'
      'Люкс'
    else
      ''
    end
  end
end

# == Schema Information
#
# Table name: apartments
#
#  id             :bigint           not null, primary key
#  address        :string           not null
#  comfort_level  :integer          default("standard"), not null
#  count_rooms    :integer          default(0), not null
#  day_price      :decimal(10, 2)
#  description    :text             not null
#  hour_price     :decimal(10, 2)
#  latitude       :float
#  lead           :text
#  longitude      :float
#  owner_name     :string           not null
#  owner_phone    :string           not null
#  removed        :boolean          default(FALSE), not null
#  slug           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  city_region_id :bigint
#
# Indexes
#
#  index_apartments_on_city_region_id  (city_region_id)
#  index_apartments_on_slug            (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (city_region_id => city_regions.id)
#
