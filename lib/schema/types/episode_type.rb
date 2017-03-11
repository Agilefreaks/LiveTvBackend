# frozen_string_literal: true
require 'graphql'
require 'schema/interfaces/content_interface'
require 'schema/interfaces/streamable_interface'

module Livetv
  module Types
    EpisodeType = GraphQL::ObjectType.define do
      interfaces [Livetv::Interfaces::ContentInterface, Livetv::Interfaces::StreamableInterface]

      name 'Episode'
      description 'A episode'

      field :season_number, !types.Int, 'The season number'
      field :episode_number, !types.Int, 'The episode number'
    end
  end
end
