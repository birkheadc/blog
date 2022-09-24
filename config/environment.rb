# Load the Rails application.
require_relative "application"

if Rails.env.development?
  credentials_config = File.join(Rails.root, 'config', 'credentials.rb')
  load(credentials_config) if File.exists?(credentials_config)
end
# Initialize the Rails application.
Rails.application.initialize!