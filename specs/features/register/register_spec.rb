# frozen_string_literal: true

require 'securerandom'
require 'byebug'

module QA
  RSpec.context 'API' do
    describe '/register' do
      before(:context) do
        @api_client = Runtime::API::Client.new(env = :local)
        @content_type = { content_type: 'application/x-www-form-urlencoded' }
        @empty_field_response = { result: false, message: {
          email: ['This field is required.'],
          username: ['This field is required.'],
          address: ['This field is required.'],
          birthday: ['This field is required.']
        } }
      end

      before(:each) do
        username = SecureRandom.alphanumeric(10)
        @form_data = {
          username: username,
          email: '#{username}@testrisk.com',
          birthday: '2013-09-24',
          address: 'Bakırköy No:4/3 İstanbul/Turkey',
          client: 'app'
        }
      end

      let(:register) { Runtime::API::Address.new(@api_client, path = 'register') }

      it 'should register with valid data' do
        post register.url, @form_data, @content_type
        expect_status '201'
        expect_json(result: true, message: 'User is recorded with given informations.')
      end

      it 'should not register with already registered user' do
        post register.url, @form_data, @content_type
        expect_status '201'
        expect_json(result: true, message: 'User is recorded with given informations.')

        post register.url, @form_data, @content_type
        expect_status '202'
        expect_json(result: false, message: 'Member already recorded!')
      end

      it 'should not register with empty fields' do
        post register.url, @content_type
        expect_status '202'
        expect_json(@empty_field_response)
      end

      it 'should not register with empty username' do
        post register.url, @form_data.delete(:username), @content_type
        expect_status '202'
        expect_json(@empty_field_response)
      end

      it 'should not register with empty email' do
        post register.url, @form_data.delete(:email), @content_type
        expect_status '202'
        expect_json(@empty_field_response)
      end

      it 'should not register with empty birthday' do
        post register.url, @form_data.delete(:birthday), @content_type
        expect_status '202'
        expect_json(@empty_field_response)
      end

      it 'should not register with empty address' do
        post register.url, @form_data.delete(:address), @content_type
        expect_status '202'
        expect_json(@empty_field_response)
      end

      it 'should not register with wrong birthday format' do
        post register.url, @form_data.update(birthday: '09-24-2013'), @content_type
        expect_status '202'
        expect_json(
          result: false,
          message: "[\"'09-24-2013' value has an invalid date format. It must be in YYYY-MM-DD format.\"]"
        )
      end
    end
  end
end
