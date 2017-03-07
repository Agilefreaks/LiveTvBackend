# frozen_string_literal: true
require 'byebug' if ENV['RACK_ENV'] == 'development'
require 'pry' if ENV['RACK_ENV'] == 'development'

require_relative 'livetv/container'

Livetv::Container.finalize!

require 'livetv/application'

require 'livetv/transactions'
Livetv::Container.require 'transactions/**/*.rb'
