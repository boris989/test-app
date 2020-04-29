# frozen_string_literal: true

class CreateApartmentImages < ActiveRecord::Migration[5.2]
  def change
    create_table :apartment_images do |t|
      t.references :apartment
      t.string :content
      t.integer :position

      t.timestamps
    end
  end
end
