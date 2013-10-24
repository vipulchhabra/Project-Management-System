# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Vipcs::Application.config.secret_key_base = 'deacda03f1466c581af65355c87f796a76372a1de6c035747d2d6dfb05a77c37c7610b5a5d5f0aae6e47ec1908f6b325caec0d61ba365a2e12255c74b7258e45'
Vipcs::Application.config.secret_token = 'abacda03f1466c581af65355c87f796a76372a1de6c035747d2d6dfb05a77c37c7610b5a5d5f0aae6e47ec1908f6b325caec0d61ba365a2e12255c74b7258e45'
