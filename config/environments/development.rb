Jets.application.configure do

  config.domain.cert_arn = "arn:aws:acm:us-east-1:267897273784:certificate/870617c3-191b-476d-8a8a-b66c1b358408" # String
  config.domain.hosted_zone_name = "joyful-noise.link"
  config.domain.name = "api.joyful-noise.link"
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000, protocol: "https" }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.show_previews = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            ENV['STMP_USER'],
    password:             ENV['STMP_PASS'],
    authentication:       'plain'}

    #enable_starttls_auto: true}
  #
  # Example:
  # config.function.memory_size = 1536

  # config.action_mailer.raise_delivery_errors = false
  # Docs: http://rubyonjets.com/docs/email-sending/
end
