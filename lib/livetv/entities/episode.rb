# frozen_string_literal: true
require 'types'

module Livetv
  module Entities
    class Episode < ::Types::Struct
      constructor_type :symbolized

      attribute :url, ::Types::String
      attribute :title, ::Types::String
      attribute :season_number, ::Types::Strict::Int
      attribute :episode_number, ::Types::Strict::Int
    end
  end
end
