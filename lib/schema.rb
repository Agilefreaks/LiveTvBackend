# frozen_string_literal: true
require 'graphql'
require 'schema/types/query_type'

Schema = GraphQL::Schema.define do
  query Livetv::Types::QueryType
end
