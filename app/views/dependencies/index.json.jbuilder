# frozen_string_literal: true

json.array! @dependencies, partial: "dependencies/dependency", as: :dependency
