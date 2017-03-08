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

            m.failure do |error|
              { error: error }.to_json
            end
          end
        end
      end
    end
  end
end
