# frozen_string_literal: true

module QA
  module Runtime
    module API

      class Request
        # request should be used this class
        # QA::Runtime::API::Request.new()
        def initialize(address, access_token = nil, headers = nil); end
      end
    end
  end
end
