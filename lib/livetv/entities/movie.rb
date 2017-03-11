# frozen_string_literal: true
require 'types'

module Livetv
  module Entities
    class Movie < ::Types::Struct
      constructor_type :symbolized

      attribute :url, ::Types::String
      attribute :title, ::Types::String
      attribute :description, ::Types::String
    end
  end
end
