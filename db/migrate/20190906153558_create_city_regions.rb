# frozen_string_literal: true

class CreateCityRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :city_regions do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
