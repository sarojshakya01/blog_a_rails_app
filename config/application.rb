require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.action_dispatch.default_headers = {
      # "X-Frame-Options" => "DENY",
      # "X-Frame-Options" => "ALLOWALL",
      # "X-Frame-Options" => "ALLOW-FROM http://iframe.demo.com:8000/",
      # "X-XSS-Protection" => "1; mode=block",
      # "X-Content-Type-Options" => "nosniff",
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
