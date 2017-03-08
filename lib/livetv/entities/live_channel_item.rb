# frozen_string_literal: true
require 'types'
require 'livetv/entities/live_channel'

module Livetv
  module Entities
    class LiveChannelItem < ::Types::Struct
      constructor_type :symbolized

      attribute :id, ::Types::Strict::Int
      attribute :starts_at, ::Types::DateTime
      attribute :content, ::Types::String
      attribute :live_channel, LiveChannel
    end
  end
end
