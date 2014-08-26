require 'streamlog/content_length_with_exclusions'

module Streamlog
  class Engine < ::Rails::Engine
    isolate_namespace Streamlog

    config.middleware.use Rack::ContentLengthWithExclusions, exclude: proc { |env|
      env['PATH_INFO'] == 'streamlog/stream'
    }
    config.preload_frameworks = true
    config.allow_concurrency = true
  end
end
