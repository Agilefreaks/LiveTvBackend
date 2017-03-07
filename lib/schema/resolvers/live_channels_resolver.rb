# frozen_string_literal: true
require 'livetv/import'

module Livetv
  module Resolvers
    class LiveChannelsResolver
      include Livetv::Import['persistence.repositories.live_channels']

      def call(_obj, _arg, _ctx)
        live_channels.listing
      end
    end
  end
end
