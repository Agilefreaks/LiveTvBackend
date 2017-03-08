# frozen_string_literal: true
require 'graphql'
require 'schema/interfaces/content_interface'

module Livetv
  module Types
    MovieType = GraphQL::ObjectType.define do
      interfaces [Livetv::Interfaces::ContentInterface]

      name 'Movie'
      description 'A movie'

      field :description, !types.String, 'The description of the movie'
    end
  end
end
