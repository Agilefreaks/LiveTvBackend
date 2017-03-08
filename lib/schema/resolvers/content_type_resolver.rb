# frozen_string_literal: true
require 'schema/types/upcoming_type'
require 'schema/types/episode_type'
require 'schema/types/movie_type'
require 'livetv/entities/upcoming_item'
require 'livetv/entities/episode'
require 'livetv/entities/movie'

module Livetv
  module Resolvers
    class ContentTypeResolver
      def call(obj, _ctx)
        case obj
        when Livetv::Entities::UpcomingItem
          Livetv::Types::UpcomingType
        when Livetv::Entities::Episode
          Livetv::Types::EpisodeType
        when Livetv::Entities::Movie
          Livetv::Types::MovieType
        else
          raise("Don't know how to get the GraphQL type of a #{obj.class.name} (#{obj.inspect})")
        end
      end
    end
  end
end
