# frozen_string_literal: true
require 'matcher'
require 'json'

module Operations
  class ParseParams
    include Livetv::Matcher
    include Dry::Monads::Try::Mixin

    def call(request)
      parse_query_from(request).or(parse_body_from(request))
    end

    private

      def parse_query_from(request)
        if request['query']
          Dry::Monads::Right(query: request['query'], variables: Dry::Monads::Maybe(request['variables']))
        else
          go_left
        end
      end

      def parse_body_from(request)
        Try(JSON::ParserError) { JSON.parse(request.body.read) }.bind { |parsed_body| parse_query_from(parsed_body) }
      end

      def go_left
        Dry::Monads::Left(:no_query)
      end
  end
end
