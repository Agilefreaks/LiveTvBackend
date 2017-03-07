# frozen_string_literal: true
require 'graphql'
require 'schema/types/live_channel_type'

module Livetv
  module Types
    QueryType = GraphQL::ObjectType.define do
      name 'Query'
      description 'The query root of the schema'

      field :live_channels do
        type types[LiveChannelType]
        description 'List all live channels'

        resolve ->(_obj, _arg, _ctx) { [Livetv::Entities::LiveChannel.new(id: 42, name: 'one'), Livetv::Entities::LiveChannel.new(id: 43, name: 'Two')] }
      end
    end
  end
end
