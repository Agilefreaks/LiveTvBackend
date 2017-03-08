# frozen_string_literal: true
require 'faker'
require 'livetv/entities/live_channel_item'
require 'livetv/entities/upcoming_item'
require 'livetv/entities/episode'
require 'livetv/entities/movie'

module Livetv
  module Persistence
    module Repositories
      class LiveChannelItems
        def initialize
          @urls = {}
          @urls[42] = 'http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8'
          @urls[43] = 'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8'
          @urls[44] = 'http://www.streambox.fr/playlists/test_001/stream.m3u8'
          @urls[45] = 'https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8'
        end

        def current_for(live_channel)
          build_item(0, live_channel)
        end

        def list_for(live_chanel)
          Array.new(5) { |index| build_item(index + 1, live_chanel) }
        end

        def get_content_for(live_channel_item)
          if live_channel_item.id.zero?
            live_channel = live_channel_item.live_channel
            if live_channel.id.even?
              Livetv::Entities::Episode.new(title: 'Some episode', season_number: 1, episode_number: 2, url: @urls[live_channel.id])
            else
              Livetv::Entities::Movie.new(title: 'Some movie', description: 'The greatest movie of all times', url: @urls[live_channel.id])
            end
          else
            Livetv::Entities::UpcomingItem.new(id: 42)
          end
        end

        private

          def build_item(index, live_channel)
            attributes = { id: index, starts_at: calculate_time(index), content: "#{live_channel.name} #{index}", live_channel: live_channel }
            Livetv::Entities::LiveChannelItem.new(attributes)
          end

          def calculate_time(index)
            Time.now.utc + index * 24 * 60 * 60
          end
      end
    end
  end
end
