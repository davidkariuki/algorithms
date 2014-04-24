require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'bundler/setup'
Bundler.setup
require 'algorithms'

RSpec.configure do |config|
end
