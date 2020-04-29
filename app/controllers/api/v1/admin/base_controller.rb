# frozen_string_literal: true

class Api::V1::Admin::BaseController < ApplicationController
  before_action :authenticate_admin_user!

  private

  def current_access_token
    return if request.headers['Authorization'].blank?

    Token.not_expired.find_by(value: request.headers['Authorization'].split(' ')[1])
  end

  def current_admin_user
    return if current_access_token.blank?

    current_access_token.admin_user
  end

  def authenticate_admin_user!
    return if current_admin_user.present?

    render nothing: true, status: :unauthorized
  end
end
