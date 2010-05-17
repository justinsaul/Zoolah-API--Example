# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_zoolah_example_session',
  :secret      => '6a8ba906cf4b8923260a34dfa4d5cec9396ad892deedb534fb3242ad7002cfaf9dbd660180ecdb205a49f2e1c001e5496f2efa9574cb066f2d5a2a25addefcdd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
