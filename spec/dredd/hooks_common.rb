# frozen_string_literal: true

require "json"
require "dredd_hooks/methods"

# rubocop:disable Style/MixinUsage
include DreddHooks::Methods
# rubocop:enable Style/MixinUsage

before_each do |transaction|
  transaction["request"]["headers"]["Auth-Token"] = "secret"
end

before "comment > /comments > create a comment > 201 > application/json; charset=utf-8" do |transaction|
  request_body = JSON.parse transaction["request"]["body"]
  request_body["dependency_id"] = 1
  transaction["request"]["body"] = request_body.to_json
end
