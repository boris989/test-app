class AddLeadToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :lead, :text
  end
end
