# frozen_string_literal: true
require 'livetv/import'

module Livetv
  module Resolvers
    class LiveChannelNowPLayingResolver
      include Import['persistence.repositories.live_channel_items']

      def call(live_channel, _args, _cxt)
        live_channel_items.current_for(live_channel)
      end
    end
  end
end
