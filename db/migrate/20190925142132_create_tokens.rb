# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.references :admin_user, foreign_key: true, null: false
      t.string :value, null: false
      t.datetime :expires_in, null: false

      t.timestamps
    end

    add_index :tokens, :value, unique: true
  end
end
