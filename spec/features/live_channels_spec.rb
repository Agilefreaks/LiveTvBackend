# frozen_string_literal: true
require 'app_helper'

RSpec.describe 'Live Channels', type: :request do
  subject(:result) do
    request
    JSON.parse(last_response.body)
  end

  let(:query) {}
  let(:request) { post '/graphql', { query: query }.to_json }

  context 'with a index query' do
    let(:query) { '{ live_channels { name } }' }

    it 'will return 4 live channels' do
      expect(result['data']['live_channels'].count).to eq 4
    end

    context 'including items' do
      let(:query) { '{ live_channels { name items { starts_at } } }' }

      it 'will return items' do
        expect(result['data']['live_channels'].first['items'].count).to eq 5
      end
    end
  end
end
