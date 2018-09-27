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
    if @dependency.save
      redirect_to @dependency, notice: "Dependency was successfully created."
    else
      render :new
    end
  end

  def update
    if @dependency.update(dependency_params)
      redirect_to @dependency, notice: "Dependency was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @dependency.destroy
    redirect_to dependencies_url,
      notice: "Dependency was successfully destroyed."
  end

private

  def set_dependency
    @dependency = Dependency.find(params[:id])
  end

  def dependency_params
    params.require(:dependency).permit(:name)
  end
end
