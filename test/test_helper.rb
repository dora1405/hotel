# Add simplecov
require 'simplecov'
SimpleCov.start
require 'date'

require "minitest"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative '../lib/booking_manager'
require_relative '../lib/date'
require_relative '../lib/reservation'

