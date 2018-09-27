# frozen_string_literal: true

json.array! @comments, partial: "api/comments/comment", as: :comment
