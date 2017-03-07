# frozen_string_literal: true
# Define your routes like this:
require 'schema'

module Livetv
  class Application
    plugin :json

    route 'graphql' do |r|
      r.get do
        query = r['query']
        variables = r['variables']
        result = Schema.execute(query, variables: variables)
        result.to_json
      end

      r.post do
        params = JSON.parse(r.body.read)
        query = params['query']
        variables = params['variables']
        result = Schema.execute(query, variables: variables)
        result.to_json
      end
    end
  end
end
