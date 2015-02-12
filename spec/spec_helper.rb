ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

RSpec.configure do |config|
 # Use color in STDOUT
   config.color_enabled = true

 # Use color not only in STDOUT but also in pagers and files
   config.tty = true

 # Use the specified formatter
   config.formatter = :documentation # :progress, :html, :textmate
end