# frozen_string_literal: true

class Token < ApplicationRecord
  belongs_to :admin_user

  scope :not_expired, -> { where('expires_in > ?', Time.zone.now) }
end

# == Schema Information
#
# Table name: tokens
#
#  id            :bigint           not null, primary key
#  expires_in    :datetime         not null
#  value         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :bigint           not null
#
# Indexes
#
#  index_tokens_on_admin_user_id  (admin_user_id)
#  index_tokens_on_value          (value) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (admin_user_id => admin_users.id)
#
