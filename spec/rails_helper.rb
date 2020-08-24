require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "shoulda/matchers"
require "capybara/rspec"
require "support/database_cleaner"
require "sidekiq/testing"
require "support/controller_macros"

include ControllerMacros

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end

RSpec::Sidekiq.configure do |config|
  config.clear_all_enqueued_jobs = true 
  config.enable_terminal_colours = true 
  config.warn_when_jobs_not_processed_by_sidekiq = true
end
