# frozen_string_literal: true

require 'bundler/ecology/version'
require 'yaml'

module Bundler
  module Ecology
    def self.register
      config_file_content = File.read('.bundler-ecology.yml')
      config = YAML.safe_load(config_file_content, symbolize_names: true)
      @gem_names = config[:disallowed].map { |item| item[:name] }

      Bundler::Plugin.add_hook('before-install') do |dependency|
        next unless @gem_names.include?(dependency.name)

        raise Bundler::PluginError,
              "Gemfile contains a disallowed dependency: #{dependency.name}"
      end
    end
  end
end
