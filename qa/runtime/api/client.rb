# frozen_string_literal: true

require 'airborne'
require 'byebug'

module QA
  module Runtime
    module API
      class Client
        attr_reader :env, :user, :client

        def initialize(env = :dev, client = 'android', user = :anonymous, access_token: nil)
          @env = env
          @access_token = access_token
          @user = user
          @client = client
        end

        def access_token
          create_access_token if access_token.nil?
        end

        def self.as_admin; end

        private

        def create_access_token;
          # you can read token from your ENV
          # ENV["API_TEST_ACCESS_TOKEN"]
          #
          # or you can call api to create token
          #
        end
      end
    end
  end
end
