# frozen_string_literal: true

class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :address, null: false
      t.text :description, null: false
      t.integer :count_rooms, null: false, default: 0, limit: 2
      t.integer :comfort_level, null: false, default: 0, limit: 2
      t.decimal :hour_price, precision: 10, scale: 2
      t.decimal :day_price, precision: 10, scale: 2
      t.string :owner_name, null: false
      t.string :owner_phone, null: false
      t.float :latitude
      t.float :longitude
      t.references :city_region, foreign_key: true

      t.timestamps
    end
  end
end
