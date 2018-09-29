# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :dependency

  def self.published
    where(published: true)
  end
end
