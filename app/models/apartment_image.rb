# frozen_string_literal: true

class ApartmentImage < ApplicationRecord
  belongs_to :apartment
  mount_uploader :content, ApartmentImageUploader
end

# == Schema Information
#
# Table name: apartment_images
#
#  id           :bigint           not null, primary key
#  content      :string
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  apartment_id :bigint
#
# Indexes
#
#  index_apartment_images_on_apartment_id  (apartment_id)
#
