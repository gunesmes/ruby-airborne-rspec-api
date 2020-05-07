# frozen_string_literal: true

module QA
  module Runtime
    module API
      class Address
        attr_accessor :path, :client, :user, :env, :params

        def initialize(api_client, path)
          @path = path
          @client = api_client.client
          @user = api_client.user
          @env = api_client.env
        end

        def base_url
          ENV['BASE_URL'] || 'localhost:8001'
        end

        def set_env
          env.nil? ? ENV['ENV'] : env
        end

        def url
          # set the api url for each environment

          case set_env
          when :local
            "http://#{base_url}/api/#{path}"
          when :dev
            "http://dev.#{base_url}/api/#{path}"
          when :stg
            "http://staging.#{base_url}/api/#{path}"
          when :live
            "http://#{base_url}/api/#{path}"
          end
        end

      end
    end
  end
end

