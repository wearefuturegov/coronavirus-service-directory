# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings = {
    user_name: 'api_key',
    password: ENV["SENDGRID_API_KEY"],
    domain: 'wearefuturegov.com',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
}

# Initialize the Rails application.
Rails.application.initialize!