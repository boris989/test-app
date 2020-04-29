# frozen_string_literal: true

class AdminUser < ApplicationRecord
  has_secure_password

  has_many :tokens, dependent: :destroy
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :downcase_email

  def downcase_email
    return if email.blank?

    self.email = email.downcase
  end

  def generate_token
    token = nil
    loop do
      token = SecureRandom.hex
      break unless Token.exists?(value: token)
    end
    tokens.create(value: token, expires_in: 1.month.from_now)
  end
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
