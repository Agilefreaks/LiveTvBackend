# frozen_string_literal: true
require 'schema'

module Livetv
  class Application
    plugin :json

    route 'graphql' do |r|
      r.is do
        r.resolve('transactions.execute_query') do |execute_query|
          execute_query.call(r) do |m|
            m.success(&:to_json)

            m.failure do
              # when will it fail?
            end
          end
        end
      end
    end
  end
end
