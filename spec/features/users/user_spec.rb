# frozen_string_literal: true

module QA
  RSpec.context 'API' do
    describe '/user' do
      before(:context) do
        @api_client = Runtime::API::Client.new(env = :local)
      end

      let(:valid_user) { Runtime::API::Address.new(@api_client, path = 'user?username=testusername1') }
      let(:non_existing_user) { Runtime::API::Address.new(@api_client, path = 'user?username=NonExistingUser') }

      it 'should get a valid users' do
        get valid_user.url
        expect_status '200'
        expect_json_types(
          pk: :integer,
          fields: {
            username: :string,
            email: :string,
            address: :string,
            birthday: :string,
            premium: :boolean
          }
        )

        expect_json(model: 'src.users')
      end

      it 'should return error for post request' do
        post valid_user.url
        expect_status '403'
      end

      it 'should return empty user list' do
        get non_existing_user.url
        expect_status '200'
        expect_json({})
        expect(json_body.empty?).to be true
      end
    end
  end
end