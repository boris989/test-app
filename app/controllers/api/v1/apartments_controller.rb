# frozen_string_literal: true

class Api::V1::ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all.order(id: :desc)
    @apartments = @apartments.where(count_rooms: params[:count_rooms]) if params[:count_rooms].present?

    render json: @apartments
  end

  def show
    @apartment = Apartment.find_by!(slug: params[:slug])
    render json: @apartment
  end
end
