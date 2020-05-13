# frozen_string_literal: true


module QA
  module Runtime
    module Env
      extend self

      attr_writer :personal_access_token

      def admin_password
        ENV['ADMIN_PASSWORD']
      end

      def admin_username
        ENV['ADMIN_USERNAME']
      end

      def admin_personal_access_token
        ENV['QA_ADMIN_ACCESS_TOKEN']
      end

      def debug?
        enabled?(ENV['QA_DEBUG'], default: false)
      end

      def log_destination
        ENV['QA_LOG_PATH'] || $stdout
      end

      # specifies token that can be used for the api
      def personal_access_token
        @personal_access_token ||= ENV['API_TEST_ACCESS_TOKEN']
      end

      def username
        ENV['USERNAME']
      end

      def password
        ENV['PASSWORD']
      end

      def test_user_1
        ENV['test_user_1'] || 'test-user-1'
      end

      def qa_password_1
        ENV['QA_PASSWORD_1']
      end

      def test_user_2
        ENV['test_user_2'] || 'test-user-2'
      end

      def qa_password_2
        ENV['QA_PASSWORD_2']
      end

      def test_user_3
        ENV['test_user_3'] || 'test-user-3'
      end

      def qa_password_3
        ENV['QA_PASSWORD_3']
      end

      def enabled?(value, default: true)
        return default if value.nil?

        (value =~ /^(false|no|0)$/i) != 0
      end
    end
  end
end
