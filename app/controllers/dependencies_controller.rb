# frozen_string_literal: true

class DependenciesController < ApplicationController
  before_action :set_dependency, only: %i[show edit update destroy]

  def index
    @dependencies = Dependency.all
  end

  def show; end

  def new
    @dependency = Dependency.new
  end

  def edit; end

  def create
    @dependency = Dependency.new(dependency_params)
    respond_to do |format|
      if @dependency.save
        format.html do
          redirect_to @dependency,
            notice: "Dependency was successfully created."
        end
        format.json do
          render :show, status: :created, location: @dependency
        end
      else
        format.html do
          render :new
        end
        format.json do
          render json: @dependency.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @dependency.update(dependency_params)
        format.html do
          redirect_to @dependency,
            notice: "Dependency was successfully updated."
        end
        format.json do
          render :show, status: :ok, location: @dependency
        end
      else
        format.html do
          render :edit
        end
        format.json do
          render json: @dependency.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @dependency.destroy
    respond_to do |format|
      format.html do
        redirect_to dependencies_url,
          notice: "Dependency was successfully destroyed."
      end
      format.json do
        head :no_content
      end
    end
  end

private

  def set_dependency
    @dependency = Dependency.find(params[:id])
  end

  def dependency_params
    params.require(:dependency).permit(:name)
  end
end
