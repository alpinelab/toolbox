# frozen_string_literal: true

class Dependency < ApplicationRecord
  has_many :comments, dependent: :destroy
end
