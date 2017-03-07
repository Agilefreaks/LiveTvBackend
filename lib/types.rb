# frozen_string_literal: true
require 'dry-struct'
require 'dry-types'

module Types
  include Dry::Types.module

  class Struct < Dry::Struct
  end
end
