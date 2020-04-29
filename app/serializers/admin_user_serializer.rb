# frozen_string_literal: true

class AdminUserSerializer < ActiveModel::Serializer
  attributes :id, :email
end

# == Schema Information
#
# Table name: admin_users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email  (email) UNIQUE
#
