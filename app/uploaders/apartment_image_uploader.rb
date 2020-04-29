# frozen_string_literal: true

class ApartmentImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  version :thumb do
    process resize_to_fill: [500, 425]
  end

  def store_dir
    return "uploads/test/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}" if Rails.env.test?

    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    return unless original_filename

    @name ||= Digest::MD5.hexdigest(File.dirname(current_path) + timestamp.to_s)
    "#{@name}.#{file.extension}"
  end

  private

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) || model.instance_variable_set(var, Time.now.to_i)
  end
end
