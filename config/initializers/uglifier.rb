# frozen_string_literal: true

if Rails.application.config.assets.js_compressor == :uglifier
  Rails.application.config.assets.js_compressor = Uglifier.new(harmony: true)
end
