# frozen_string_literal: true

require 'yaml'

module Bundler
  module Ecology
    module Handlers
      # Bundle plugin handler used with the 'before-install' hook.
      class BeforeInstall
        def initialize(config)
          @gem_names = config.fetch(:disallowed, []).map { |item| item[:name] }
        end

        def call(dependency)
          return unless @gem_names.include?(dependency.name)

          raise Bundler::PluginError,
                "Gemfile contains a disallowed dependency: #{dependency.name}"
        end
      end
    end
  end
end
