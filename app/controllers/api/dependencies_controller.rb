# frozen_string_literal: true

module API
  class DependenciesController < ApplicationController
    before_action :set_dependency, only: %i[show update destroy]

    def index
      @dependencies = Dependency.all
    end

    def show; end

    def create
      @dependency = Dependency.new(dependency_params)
      if @dependency.save
        render :show, status: :created, location: @dependency
      else
        render json: @dependency.errors, status: :unprocessable_entity
      end
    end

    def update
      if @dependency.update(dependency_params)
        render :show, status: :ok, location: @dependency
      else
        render json: @dependency.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @dependency.destroy
      head :no_content
    end

  private

    def set_dependency
      @dependency = Dependency.find(params[:id])
    end

    def dependency_params
      params.require(:dependency).permit(:name)
    end
  end
end
