# frozen_string_literal: true
# TODO: no database yet
# require_relative 'db_helper'

require 'spec_helper'
require 'rack/test'

Dir[SPEC_ROOT.join('support/app/*.rb').to_s].each(&method(:require))
Dir[SPEC_ROOT.join('shared/app/*.rb').to_s].each(&method(:require))

require SPEC_ROOT.join('../system/boot').realpath

RSpec.configure do |config|
  config.include TestHelpers, type: :request
  config.include Rack::Test::Methods, type: :request

  config.before :suite do
    TestHelpers.app.freeze
  end
end
