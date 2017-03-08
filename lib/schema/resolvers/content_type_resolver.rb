# frozen_string_literal: true
require 'schema/types/upcoming_type'

module Livetv
  module Resolvers
    class ContentTypeResolver
      def call(_obj, _ctx)
        Livetv::Types::UpcomingType
      end
    end
  end
end
