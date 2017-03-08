# frozen_string_literal: true
require 'graphql'
require 'schema/types/query_type'
require 'schema/types/upcoming_type'
require 'schema/resolvers/content_type_resolver'

Schema = GraphQL::Schema.define do
  query Livetv::Types::QueryType

  resolve_type(Livetv::Resolvers::ContentTypeResolver.new)

  orphan_types [Livetv::Types::UpcomingType]
end
