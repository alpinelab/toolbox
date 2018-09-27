# frozen_string_literal: true

class DependenciesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_dependency, only: %i[show edit update destroy]

  # GET /dependencies
  # GET /dependencies.json
  def index
    @dependencies = Dependency.all
  end

  # GET /dependencies/1
  # GET /dependencies/1.json
  def show; end

  # GET /dependencies/new
  def new
    @dependency = Dependency.new
  end

  # GET /dependencies/1/edit
  def edit; end

  # POST /dependencies
  # POST /dependencies.json
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

  # PATCH/PUT /dependencies/1
  # PATCH/PUT /dependencies/1.json
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

  # DELETE /dependencies/1
  # DELETE /dependencies/1.json
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

  # Use callbacks to share common setup or constraints between actions.
  def set_dependency
    @dependency = Dependency.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def dependency_params
    params.require(:dependency).permit(:name)
  end
end
