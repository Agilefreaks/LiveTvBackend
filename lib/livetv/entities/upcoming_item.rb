# frozen_string_literal: true
require 'types'

module Livetv
  module Entities
    class UpcomingItem < ::Types::Struct
      constructor_type :symbolized

      attribute :id, ::Types::Strict::Int

      def title
        'Upcoming'
      end
    end
  end
end
