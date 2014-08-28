require 'streamlog/engine'

module Streamlog
  autoload :SSE, 'streamlog/sse'
  autoload :LogColorize, 'streamlog/log_colorize'

  mattr_accessor :engine_layout
  @@engine_layout = true
end
