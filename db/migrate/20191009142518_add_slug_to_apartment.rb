# frozen_string_literal: true

class AddSlugToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :slug, :string, null: false
    add_index :apartments, :slug, unique: true
  end
end
