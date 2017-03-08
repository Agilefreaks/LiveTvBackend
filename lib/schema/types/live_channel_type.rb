# frozen_string_literal: true
require 'graphql'
require 'schema/types/live_channel_item_type'
require 'schema/resolvers/live_channel_items_resolver'

module Livetv
  module Types
    LiveChannelType = GraphQL::ObjectType.define do
      name 'LiveChannel'
      description 'A live channel'

      field :id, !types.ID, 'The id of the channel'
      field :name, !types.String, 'The name of the channel'
      field :items, types[LiveChannelItemType], 'A list of items for this channel' do
        complexity 2
        resolve(Livetv::Resolvers::LiveChannelItemsResolver.new)
      end
    end
  end
end
