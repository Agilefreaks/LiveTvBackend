# frozen_string_literal: true
require 'graphql'
require 'schema/types/episode_type'
require 'schema/types/movie_type'
require 'schema/types/upcoming_type'

module Livetv
  module Unions
    ContentUnion = GraphQL::UnionType.define do
      name 'ContentUnion'
      description 'All the content types'

      possible_types [Livetv::Types::MovieType, Livetv::Types::EpisodeType, Livetv::Types::UpcomingType]
    end
  end
end
