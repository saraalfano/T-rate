ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "capybara/rails"
require "capybara/minitest"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include Capybara::DSL 
  include Capybara::Minitest::Assertions
  teardown do 
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
  # Add more helper methods to be used by all tests here...
end
