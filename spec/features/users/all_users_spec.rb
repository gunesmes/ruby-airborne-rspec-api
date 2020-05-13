# frozen_string_literal: true

module QA
  RSpec.context 'API' do
    describe '/users' do
      before(:context) do
        @api_client = Runtime::API::Client.new(env = :local)
      end

      let(:address) { Runtime::API::Address.new(@api_client, 'users') }

      it 'should get all users' do
        get address.url
        expect_status '200'
        expect_json_types(:array_of_arrays)
        expect(json_body[0][:pk]).to eql(1)
        expect(json_body[0].class).to be(Hash)
        expect(json_body.size).to be > 0
        expect(json_body[0][:model]).to eql('src.users')
      end
    end
  end
end