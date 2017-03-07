# frozen_string_literal: true
require 'livetv/view_controller'

module Livetv
  module Views
    class Graphiql < Livetv::ViewController
      configure do |config|
        config.template = 'graphiql'
      end
    end
  end
end
