# frozen_string_literal: true
require 'graphql'

module Livetv
  module Types
    LiveChannelItemType = GraphQL::ObjectType.define do
      name 'LiveChannelItem'
      description 'A live channel item'

      field :starts_at, !types.String, 'The start time in UTC'
      field :content, !types.String, 'The content'
    end
  end
end
