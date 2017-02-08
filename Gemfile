source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Manage model serialization
gem 'active_model_serializers', '~> 0.10.0'

# Manage Roles
gem 'rolify'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# File Uploader
gem 'paperclip', '~> 5.0.0'

# Pdf gem
gem 'prawn'

gem 'rails-i18n', '~> 5.0.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'better_errors'
  gem 'rubocop'
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
