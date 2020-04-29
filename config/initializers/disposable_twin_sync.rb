# frozen_string_literal: true

require 'reform'

Disposable::Twin::Sync.module_eval do
  def sync!(options)
    # TODO: merge this into Sync::Run or something and use in Struct, too, so we don't
    # need the representer anymore?
    options_for_sync = sync_options(Disposable::Twin::Sync::Options[options])
    schema.each(options_for_sync) do |dfn|
      property_value = sync_read(dfn)

      # Избегаем сохранения поля, если это uploader
      next if property_value.is_a? CarrierWave::Uploader::Base

      unless dfn[:nested]
        mapper.send(dfn.setter, property_value) # always sync the property
        next
      end

      # First, call sync! on nested model(s).
      # rubocop: disable  Style/LambdaCall
      nested_model = Disposable::Twin::PropertyProcessor.new(dfn, self, property_value).() { |twin| twin.sync!({}) }
      # rubocop: enable Style/LambdaCall
      next if nested_model.nil?

      # Then, write nested model to parent model, e.g. model.songs = [<Song>]
      mapper.send(dfn.setter, nested_model) # @model.artist = <Artist>
    end

    model
  end
end
