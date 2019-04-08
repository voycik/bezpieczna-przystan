# frozen_string_literal: true

Raven.configure do |config|
  config.dsn = 'https://9d6b03e30df34107b080bd8b4dd8eb7a:06c140bf60fd48c2af1ced9935701a5f@sentry.io/1433732'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
