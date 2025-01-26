# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  DEFAULT_LOCALE = I18n.default_locale

  def call(env)
    request = Rack::Request.new(env)
    locale = extract_locale_from_header(request.env['HTTP_ACCEPT_LANGUAGE'])
    I18n.locale = locale || DEFAULT_LOCALE
    @app.call(env)
  end

  private

  def extract_locale_from_header(header)
    return nil if header.nil? || header.empty?

    header.scan(/^[a-z]{2}/).first
  end
  # END
end
