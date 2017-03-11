# frozen_string_literal: true
require 'graphql'

module Livetv
  module Interfaces
    StreamableInterface = GraphQL::InterfaceType.define do
      name 'Streamable'
      description 'Stuff that one can stream'

      field :url, !types.String, 'The title'
    end
  end
end
