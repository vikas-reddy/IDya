source 'https://rubygems.org'

gem 'rails', '3.2.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end


gem 'mongoid'
gem 'bson_ext'
gem 'haml'
gem 'jquery-rails'
gem 'net-ldap'
gem 'wirble'
gem 'kaminari'
gem 'mongoid_search'


## Gems for development and test environment
#group :development, :test do
	#gem 'rspec-rails', '2.10.0'
	#gem 'machinist', '>= 2.0.0'
	gem 'faker', '1.0.1'
	#gem 'machinist_mongo', :git => 'git://github.com/nmerouze/machinist_mongo.git', branch: 'machinist2'
#end
## Gems for test environment
#group :test do
	#gem 'capybara', '1.1.2'
#end

group :development, :test do
	gem 'capybara'
	gem 'rspec-rails', '>= 2.0.0.beta.12'
	gem 'factory_girl'
	gem 'factory_girl_rails'
	gem 'mongoid-rspec', :require => false
end
group :test do
	gem 'cucumber-rails', require: false
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
