# frozen_string_literal: true
require 'graphql'
require 'schema/interfaces/streamable_interface'
require 'schema/resolvers/live_channel_item_content_resolver'

module Livetv
  module Types
    LiveChannelSteamableItemType = GraphQL::ObjectType.define do
      name 'LiveChannelStreamableItem'
      description 'A live channel item'

      field :starts_at, !types.String, 'The start time in UTC'
      field :content, Livetv::Interfaces::StreamableInterface, 'The content' do
        complexity 2
        resolve(Livetv::Resolvers::LiveChannelItemContentResolver.new)
      end
    end
  end
end
