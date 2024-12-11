require 'rack'
require 'time'

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, body = @app.call(env)
    end_time = Time.now

    elapsed_time = ((end_time - start_time) * 1_000_000).to_i

    headers['X-Execution-Time'] = "#{elapsed_time} µs"

    [status, headers, body]
  end
end