# frozen_string_literal: true
require 'graphql'
require 'schema/interfaces/content_interface'
require 'schema/resolvers/live_channel_item_content_resolver'

module Livetv
  module Types
    LiveChannelItemType = GraphQL::ObjectType.define do
      name 'LiveChannelItem'
      description 'A live channel item'

      field :starts_at, !types.String, 'The start time in UTC'
      field :content, Livetv::Interfaces::ContentInterface, 'The content' do
        complexity 2
        resolve(Livetv::Resolvers::LiveChannelItemContentResolver.new)
      end
    end
  end
end
