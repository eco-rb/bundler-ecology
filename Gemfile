# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  "https://github.com/#{repo_name}"
end

gemspec

gem 'rake'

group :development do
  gem 'pry-byebug', platform: :mri
  gem 'rubocop'
end

group :test do
  gem 'rspec'
end
