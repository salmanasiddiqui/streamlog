require_dependency 'streamlog/application_controller'

module Streamlog
  class LogsController < ApplicationController
    include ActionController::Live
    layout 'application' unless Streamlog.engine_layout

    def index
    end

    def stream
      response.headers['Content-Type'] = 'text/event-stream'

      sse = Streamlog::SSE.new(response.stream)
      colorizer = Streamlog::LogColorize.new

      begin
        File::Tail::Logfile.tail(Rails.root.join('log', Rails.env+'.log').to_s, backward: 1) do |line|
          sse.write colorizer.colorize_line line
        end
      rescue IOError
        # When the client disconnects, we'll get an IOError on write
      ensure
        sse.close
      end
    end
  end
end
