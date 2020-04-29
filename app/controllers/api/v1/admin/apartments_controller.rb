# frozen_string_literal: true

class Api::V1::Admin::ApartmentsController < Api::V1::Admin::BaseController
  def index
    run Admin::Apartment::Operation::Index do |result|
      render json: result['models']
      return
    end
  end

  def create
    run Admin::Apartment::Operation::Create do
      render json: @model
      return
    end

    render json: { errors: @form.errors }, status: :unprocessable_entity
  end

  def update
    run Admin::Apartment::Operation::Update do
      render json: @model
      return
    end

    render json: { errors: @form.errors }, status: :unprocessable_entity
  end

  def show
    run Admin::Apartment::Operation::Show do
      render json: @model
    end
  end

  def destroy
    run Admin::Apartment::Operation::Destroy do
      render json: @model
    end
  end
end
