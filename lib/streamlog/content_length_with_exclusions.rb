module Rack
  class ContentLengthWithExclusions < ContentLength
    def initialize(app, options = {})
      @app = app

      @exclude = options[:exclude]
    end

    def call(env)
      if @exclude && @exclude.call(env)
        @app.call(env)
      else
        super(env)
      end
    end
  end
end