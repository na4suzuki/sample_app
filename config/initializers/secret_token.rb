# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
#SampleApp::Application.config.secret_key_base = 'e39e90a7e556423f29ce53e4df70587b95e50bae7c7d0058f9eda20d73cbe5400bd27d39c67a48bdd5a4d61dc1b1c7cd6ac4d6cfff4d60229d7ebc097fbc1bbf'
SampleApp::Application.config.secret_key_base = secure_token
