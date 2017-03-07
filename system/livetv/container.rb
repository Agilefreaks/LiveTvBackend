# frozen_string_literal: true
require 'dry/web/umbrella'
require_relative 'settings'

module Livetv
  class Container < Dry::Web::Umbrella
    configure do
      config.name = :livetv
      config.default_namespace = 'livetv'
      config.settings_loader = Livetv::Settings
      config.listeners = true

      config.auto_register = %w(
        lib/livetv
      )
    end

    load_paths! 'lib', 'system'

    def self.settings
      config.settings
    end
  end
end
