# frozen_string_literal: true
require 'schema'
require 'matcher'

module Operations
  class ExecuteQuery
    include Livetv::Matcher
    include Dry::Monads::Try::Mixin

    def call(input)
      Try() { Schema.execute(input[:query], variables: input[:variables].value) }.bind { |result| Dry::Monads::Right(result) }
    end
  end
end
