# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    body_content = body.join()
    signature = Digest::SHA256.hexdigest(body_content)

    new_body = body_content + "\n#{signature}"

    headers['Content-Length'] = new_body.bytesize.to_s

    [status, headers, [new_body]]
    # END
  end
end
