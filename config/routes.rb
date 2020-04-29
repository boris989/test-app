# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :admin do
        resource :session, only: %i[create destroy] do
          get :current_admin, on: :collection
        end
        resources :city_regions, only: %i[index create update show destroy]
        resources :apartments, only: %i[index create update show destroy]
      end
      resources :apartments, only: %i[index show], param: :slug
    end
  end
end
