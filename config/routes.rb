# frozen_string_literal: true

Rails.application.routes.draw do
  concern :resources do
    resources :dependencies
    resources :comments
  end

  scope format: ENV.key?("ALLOW_FORMAT_FROM_URL") ? nil : false do
    scope module: :api, constraints: ->(req) { req.format == :json } do
      concerns :resources
    end
    concerns :resources
  end

  root to: "home#show"
end
