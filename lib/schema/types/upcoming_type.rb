# frozen_string_literal: true
require 'graphql'
require 'schema/interfaces/content_interface'

module Livetv
  module Types
    UpcomingType = GraphQL::ObjectType.define do
      interfaces [Livetv::Interfaces::ContentInterface]

      name 'Upcoming'
      description 'A upcoming title'
    end
  end
end
