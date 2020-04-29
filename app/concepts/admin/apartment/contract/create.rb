# frozen_string_literal: true

require 'reform/form/validation/unique_validator'

module Admin::Apartment::Contract
  class Create < ApplicationForm
    property :address
    property :comfort_level
    property :count_rooms
    property :day_price
    property :description
    property :hour_price
    property :latitude
    property :longitude
    property :owner_name
    property :owner_phone
    property :city_region_id
    property :slug
    property :lead

    collection :images, populator: :populate_images do
      property :position
      property :content
      validate :presence_content

      def presence_content
        return if content.is_a? CarrierWave::Uploader::Base

        errors.add(:content, :blank) if content.blank?
      end
    end

    def populate_images(fragment:, index:, **)
      item = images.find { |image| image.id.present? && image.id.to_s == fragment['id'].to_s }
      item.position = index if item.present?
      if fragment['_destroy'] == '1'
        images.destroy(item)
        return skip!
      end
      item || images.append(ApartmentImage.new(apartment: model, position: index))
    end

    validates :address, :comfort_level, :count_rooms,
              :day_price, :description, :hour_price, :owner_name,
              :owner_phone, :slug, :lead, presence: true
    validates_uniqueness_of :slug, if: -> { slug.present? }
    validates :slug, format: { with: /\A[\w\-]+\z/ }, if: -> { slug.present? }
  end
end
