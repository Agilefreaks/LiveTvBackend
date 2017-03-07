# frozen_string_literal: true
require 'app_helper'

RSpec.describe 'Live Channels', type: :request do
  let(:query) {}
  let(:request) { post '/graphql', { query: query }.to_json }

  subject do
    request
    JSON.parse(last_response.body)
  end

  context 'with a index query' do
    let(:query) { '{ live_channels { name } }' }

    it 'will return 4 live channels' do
      expect(subject['data']['live_channels'].count).to eq 4
    end
  end
end
