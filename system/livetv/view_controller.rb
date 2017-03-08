# frozen_string_literal: true
require 'slim'
require 'dry-view'
require 'livetv/container'

module Livetv
  class ViewController < Dry::View::Controller
    configure do |config|
      config.paths = [Container.root.join('web/templates')]
      config.context = Container['view_context']
      config.layout = 'application'
    end
  end
end
