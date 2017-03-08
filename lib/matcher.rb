# frozen_string_literal: true
require 'dry-monads'
require 'dry-matcher'
require 'dry/matcher/either_matcher'

module Livetv
  Matcher = Dry::Matcher.for(:call, with: Dry::Matcher::EitherMatcher)
end
