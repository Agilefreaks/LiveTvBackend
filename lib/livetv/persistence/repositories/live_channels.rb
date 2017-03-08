# frozen_string_literal: true
require 'faker'
require 'livetv/entities/live_channel'

module Livetv
  module Persistence
    module Repositories
      class LiveChannels
        def listing
          (42..45).map { |id| Livetv::Entities::LiveChannel.new(id: id, name: Faker::Superhero.name) }
        end
      end
    end
  end
end
