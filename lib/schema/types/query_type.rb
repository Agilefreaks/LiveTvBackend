# frozen_string_literal: true
require 'graphql'
require 'schema/types/live_channel_type'
require 'schema/resolvers/live_channels_resolver'

module Livetv
  module Types
    QueryType = GraphQL::ObjectType.define do
      name 'Query'
      description 'The query root of the schema'

      field :live_channels do
        type types[LiveChannelType]
        description 'List all live channels'

        resolve(Livetv::Resolvers::LiveChannelsResolver.new)
      end
    end
  end
end
