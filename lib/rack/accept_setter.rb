module Rack
  class AcceptSetter
    require_relative "accept_setter/version"
    ACCEPT_KEY = "Accept"

    def initialize(stack, accepts)
      @stack = stack
      @accepts = accepts
    end

    def call(previous_state)
      @state = previous_state
      @status, @headers, @body = stack.call(state)

      headers[ACCEPT_KEY] = accepts

      [status, headers, body]
    end

    private def accepts
      @accepts.join(", ")
    end

    private def stack
      @stack
    end

    private def state
      @state
    end

    private def headers
      @headers
    end

    private def status
      @status
    end

    private def body
      @body
    end
  end
end
