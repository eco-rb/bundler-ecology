# frozen_string_literal: true

require 'bundler/ecology/handlers/before_install'
require 'bundler/ecology/version'

module Bundler
  module Ecology
    def self.register
      before_install_handler = Handlers::BeforeInstall.new(config)

      Bundler::Plugin.add_hook('before-install') do |dependency|
        before_install_handler.call(dependency)
      end
    end

    def self.config
      config_file_name = '.bundler-ecology.yml'
      return { disallowed: [] } unless File.exist?(config_file_name)

      config_file_content = File.read(config_file_name)
      YAML.safe_load(config_file_content, symbolize_names: true)
    end
  end
end
