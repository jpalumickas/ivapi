require "ivapi"
require "rails"
require "active_model/railtie"

module Ivapi
  class Railtie < Rails::Railtie

    config.ivapi = ActiveSupport::OrderedOptions.new

    initializer "ivapi.set_configs" do |app|
      ActiveSupport.on_load(:ivapi) do
        app.config.ivapi.each do |k,v|
          send "#{k}=", v
        end
      end
    end

    initializer "ivapi.initialize_database" do |app|
      config_file = Rails.root.join('config/ivapi.yml')
      if config_file.file?
        config = YAML.load(ERB.new(config_file.read).result)
        Ivapi.setup(config)
      end
    end
  end
end