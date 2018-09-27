# frozen_string_literal: true

json.array! @dependencies, partial: "api/dependencies/dependency", as: :dependency
