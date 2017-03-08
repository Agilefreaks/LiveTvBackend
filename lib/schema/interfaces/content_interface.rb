# frozen_string_literal: true
require 'graphql'

module Livetv
  module Interfaces
    ContentInterface = GraphQL::InterfaceType.define do
      name 'Content'
      description 'The content'

      field :title, !types.String, 'The title'
    end
  end
end
