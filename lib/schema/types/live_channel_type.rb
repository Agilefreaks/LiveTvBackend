# frozen_string_literal: true
require 'graphql'

module Livetv
  module Types
    LiveChannelType = GraphQL::ObjectType.define do
      name 'LiveChannel'
      description 'A live channel'

      field :id, !types.ID
      field :name, !types.String
    end
  end
end
