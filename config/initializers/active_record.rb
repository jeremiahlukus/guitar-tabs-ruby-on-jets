require "active_record"
ActiveRecord::Base.signed_id_verifier_secret = "custom_verfifier_secret"
