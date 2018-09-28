# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to @comment, notice: "Comment was successfully created."
        end
        format.json do
          render :show, status: :created, location: @comment
        end
      else
        format.html do
          render :new
        end
        format.json do
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html do
          redirect_to @comment, notice: "Comment was successfully updated."
        end
        format.json do
          render :show, status: :ok, location: @comment
        end
      else
        format.html do
          render :edit
        end
        format.json do
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :published, :dependency_id)
  end
end
