require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TenantaBack
  class Application < Rails::Application
    config.load_defaults 7.1

    # Ignore specific directories from eager loading
    config.autoload_paths -= %W(#{config.root}/lib)

    # Other configurations...
  end
end
