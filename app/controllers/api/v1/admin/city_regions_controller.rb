# frozen_string_literal: true

class Api::V1::Admin::CityRegionsController < Api::V1::Admin::BaseController
  before_action :set_city_region, only: %i[update destroy show]

  def index
    @city_regions = CityRegion.all.order(:name)
    render json: @city_regions
  end

  def create
    @city_region = CityRegion.new(city_region_params)
    if @city_region.save
      render json: @city_region
    else
      render json: { errors: @city_region.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @city_region
  end

  def update
    @city_region.assign_attributes(city_region_params)
    if @city_region.save
      render json: @city_region
    else
      render json: { errors: @city_region.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @city_region.destroy
    render nothing: true
  end

  private

  def city_region_params
    params.require(:city_region).permit(:name)
  end

  def set_city_region
    @city_region = CityRegion.find(params[:id])
  end
end
