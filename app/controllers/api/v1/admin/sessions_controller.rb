# frozen_string_literal: true

class Api::V1::Admin::SessionsController < Api::V1::Admin::BaseController
  skip_before_action :authenticate_admin_user!, only: %i[create destroy]

  def create
    @admin_user = AdminUser.find_by('email = ?', params[:email].downcase)
    if @admin_user.present? && @admin_user.authenticate(params[:password])
      render json: { access_token: @admin_user.generate_token.value }
    else
      head :unprocessable_entity
    end
  end

  def current_admin
    render json: current_admin_user
  end

  def destroy
    current_access_token&.destroy
    head 204
  end
end
