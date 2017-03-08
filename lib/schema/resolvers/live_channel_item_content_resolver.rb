# frozen_string_literal: true
require 'livetv/import'

module Livetv
  module Resolvers
    class LiveChannelItemContentResolver
      include Import['persistence.repositories.live_channel_items']

      def call(live_channel_item, _args, _ctx)
        live_channel_items.get_content_for(live_channel_item)
      end
    end
  end
end
