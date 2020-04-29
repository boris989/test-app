# frozen_string_literal: true

class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :address, :description, :count_rooms, :comfort_level, :hour_price,
             :day_price, :owner_name, :owner_phone, :latitude, :longitude,
             :city_region_id, :images, :slug, :lead, :comfort_level_human, :lead

  has_one :city_region

  def images
    object.images.sort_by(&:position).map { |item| ApartmentImageSerializer.new(item) }
  end

  def day_price
    object.day_price.to_i
  end

  def hour_price
    object.hour_price.to_i
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
