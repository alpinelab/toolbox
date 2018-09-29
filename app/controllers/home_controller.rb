# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @dependencies = Dependency.includes(:comments)
  end
end
