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
        def current_for(live_channel)
          build_item(0, live_channel)
        end

        def list_for(live_chanel)
          Array.new(5) { |index| build_item(index + 1, live_chanel) }
        end

        def get_content_for(live_channel_item)
          if live_channel_item.id.zero?
            if live_channel_item.live_channel.id.even?
              Livetv::Entities::Episode.new(title: 'Some episode', season_number: 1, episode_number: 2, url: 'some url')
            else
              Livetv::Entities::Movie.new(title: 'Some movie', description: 'The greatest movie of all times', url: 'some url')
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
