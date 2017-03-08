# frozen_string_literal: true
require 'types'

module Livetv
  module Entities
    class LiveChannel < Types::Struct
      constructor_type :symbolized

      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
    end
  end
end
