require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Haiku
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    require "find"
    js_path = File.join(Rails.root, "app/assets/javascripts/")
    Find.find(js_path).each do |f|
      if f.match(/^(.*)\.coffee$/)
        config.assets.precompile << $1.sub(js_path, "")
      end
    end

    css_path = File.join(Rails.root, "app/assets/stylesheets/")
    Find.find(css_path).each do |f|
      if f.match(/^(.*)\.scss$/) || f.match(/^(.*)\.sass$/)
        config.assets.precompile << $1.sub(css_path, "")
      end
    end

    vendor_path = File.join(Rails.root, "vendor/assets/")
    Find.find(vendor_path).each do |f|
      if f.match(/^(.*)\.css/) || f.match(/^(.*)\.js/)
        config.assets.precompile << $1.sub(vendor_path, "")
      end
    end
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.generators do |g|
      g.template_engine :haml
      g.helper false
      g.stylesheets false
      g.javascripts false
      g.test_framework = "rspec"
      g.controller_specs = false
    end

    # routing を外部ファイルに分割する
    # config.paths["config/routes"] << "config/routes/admin.rb"
  end

end
