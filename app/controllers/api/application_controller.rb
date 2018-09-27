# frozen_string_literal: true

module API
  class ApplicationController < ActionController::API
    before_action :authenticate
    rescue_from Toolbox::NotAuthenticatedError, with: :not_authenticated_error

  protected

    def authenticate
      return if request.headers.key? "Auth-Token"

      raise Toolbox::NotAuthenticatedError
    end

    def not_authenticated_error
      render json: { error: :unauthorized }, status: :unauthorized
    end
  end
end
