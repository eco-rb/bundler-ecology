# frozen_string_literal: true

require_relative 'lib/bundler/ecology/version'

Gem::Specification.new do |spec|
  spec.name          = 'bundler-ecology'
  spec.authors       = ['Vasily Kolesnikov']
  spec.email         = ['re.vkolesnikov@gmail.com']
  spec.version       = Bundler::Ecology::VERSION

  spec.summary       = 'Bundler plugin to avoid installing unwanted gems'
  spec.description   = 'No unwanted gems more in your Gemfile.lock'
  spec.homepage      = 'https://github.com/eco-rb/bundler-ecology'
  spec.license       = 'MIT'

  spec.files         = Dir['CHANGELOG.md', 'LICENSE', 'README.md',
                           'plugins.rb', 'lib/**/*']

  spec.require_paths = ['lib']
end
