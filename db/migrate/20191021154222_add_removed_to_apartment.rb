class AddRemovedToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :removed, :boolean, default: false, null: false
  end
end
