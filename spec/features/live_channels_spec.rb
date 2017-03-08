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

    context 'including now playing' do
      let(:query) { '{ live_channels { name now_playing { starts_at }  } }' }

      it 'will return the now playing item' do
        expect(result['data']['live_channels'].first['now_playing']['starts_at']).not_to be_nil
      end
    end

    context 'including now playing with content' do
      let(:query) { '{ live_channels { name now_playing { content { url } }  } }' }

      it 'will return the now playing item' do
        expect(result['data']['live_channels'].first['now_playing']['content']['url']).not_to be_nil
      end
    end

    context 'including items with content' do
      let(:query) { '{ live_channels { name items { content { title }  }  } }' }

      it 'will return upcoming items' do
        expect(result['data']['live_channels'].first['items'].first['content']['title']).to eq 'Upcoming'
      end
    end
  end
end
