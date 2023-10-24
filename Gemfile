source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'sentry-jets', '~> 0.4.2'
gem 'jets', '~> 4.0', '>= 4.0.4'
#gem "jets", github: "boltops-tools/jets"
#gem "jets", path: "/Users/jeremiah.parrack/freelance/jets"
# Include jetpacker if you are building html pages
gem "jetpacker"
gem 'revise_auth-jets', '~> 0.3.2'
gem "pry"
# Include pg gem if you are using ActiveRecord, remove next line
# and config/database.yml file if you are not
gem "pg"

gem "dynomite"
gem "zeitwerk", ">= 2.5.0"

# development and test groups are not bundled as part of the deployment
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'shotgun'
  gem 'rack'
  gem 'puma'
end

group :test do
  gem 'rspec' # rspec test group only or we get the "irb: warn: can't alias context from irb_context warning" when starting jets console
  gem 'launchy'
  gem 'capybara'
end

gem "pagy", "~> 6.1"

#gem "pg_search", github: "Casecommons/pg_search"
gem 'pg_search', '~> 2.3', '>= 2.3.6'

gem "activerecord", "~> 6.1"

gem "activesupport", "~> 6.1"
