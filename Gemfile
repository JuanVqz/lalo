source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.4"

gem "bootsnap", require: false
gem "pg", "~> 1.5"
gem "propshaft"
gem "puma", "~> 6.2"
gem "rails", "~> 7.0.5"
gem "slim-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "vite_rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "factory_bot_rails"
  gem "rspec-rails", "~> 6.0.2"
end

group :development do
  gem "web-console"
end
