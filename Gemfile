require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'bootstrap-sass', '2.0.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


gem "heroku"

if HOST_OS =~ /linux/i
  gem 'therubyracer', '>= 0.8.2'
end

case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
    gem 'guard-pow', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end

group :development do
  gem "guard-rspec"
  gem "guard"
  gem "rspec-rails"
  
  gem 'rb-fsevent'
  gem 'growl'
  gem 'guard-pow'
end

group :test do
  # Pretty printed test output
  gem "rspec-rails"
  gem 'turn', :require => false
  gem 'factory_girl_rails' , "~> 1.1.0" ,:require => false
  gem 'database_cleaner', ">= 0.6.7"
  gem 'mongoid-rspec', ">= 1.4.4"
  gem "capybara",">= 1.1.1"
  gem "launchy", ">= 2.0.5"
  gem 'guard-spork'
  gem 'spork'
  gem 'webrat' #web自动测试用于ruby
  gem "guard-rspec"
  gem 'guard-livereload'
  gem 'guard-bundler'
  gem 'rb-fsevent',  :require => false
  gem 'growl'
end

group :production do
  gem 'thin'
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
