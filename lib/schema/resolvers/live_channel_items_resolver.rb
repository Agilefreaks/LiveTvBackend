# frozen_string_literal: true
require 'livetv/import'

module Livetv
  module Resolvers
    class LiveChannelItemsResolver
      include Import['persistence.repositories.live_channel_items']

      def call(live_channel, _args, _ctx)
        live_channel_items.list_for(live_channel)
      end
    end
  end
end
