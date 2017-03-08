# frozen_string_literal: true
require 'types'

module Livetv
  module Entities
    class LiveChannelItem < ::Types::Struct
      constructor_type :symbolized

      attribute :starts_at, ::Types::DateTime
      attribute :content, ::Types::String
    end
  end
end
