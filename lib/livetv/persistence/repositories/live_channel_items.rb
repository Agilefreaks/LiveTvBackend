# frozen_string_literal: true
require 'faker'
require 'livetv/entities/live_channel_item'
require 'livetv/entities/upcoming_item'

module Livetv
  module Persistence
    module Repositories
      class LiveChannelItems
        def current_for(live_channel)
          build_item(0, live_channel)
        end

        def list_for(live_chanel)
          Array.new(5) { |index| build_item(index, live_chanel) }
        end

        def get_content_for(_live_channel_item)
          Livetv::Entities::UpcomingItem.new(id: 42)
        end

        private

          def build_item(index, live_channel)
            Livetv::Entities::LiveChannelItem.new(id: index, starts_at: calculate_time(index + 1), content: "#{live_channel.name} #{index}")
          end

          def calculate_time(index)
            Time.now.utc + index * 24 * 60 * 60
          end
      end
    end
  end
end
