# frozen_string_literal: true
require 'dry/web/roda/application'
require_relative 'container'

module Livetv
  class Application < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
      config.routes = 'web/routes'
    end

    opts[:root] = Pathname(__FILE__).join('../..').realpath.dirname

    use Rack::Session::Cookie, key: 'livetv.session', secret: Livetv::Container.settings.session_secret

    plugin :static, %w(/assets /robots.txt /favicon.ico /apple-touch-icon.png),
           root: opts[:root],
           header_rules: [
             [:all, { 'Cache-Control' => 'public, max-age=86400' }],
             ['/assets', { 'Cache-Control' => 'public, max-age=31536000' }]
           ]
    plugin :csrf, raise: false, check_only: ['POST:/']
    plugin :flash
    plugin :dry_view

    route do |r|
      r.multi_route

      r.root do
        r.view 'graphiql'
      end
    end

    load_routes!
  end
end
