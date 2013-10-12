# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if Rails.env.production?
  Coderheya::Application.config.secret_token = ENV['SECRET_TOKEN']
else
  Coderheya::Application.config.secret_token = "9f31c85407c5d8eb2255cfffc7479c7f"
end
