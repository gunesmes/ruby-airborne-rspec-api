# frozen_string_literal: true

require 'airborne'


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

        def create_access_token; end
      end
    end
  end
end
