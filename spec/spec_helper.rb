$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'vscale/api'
require 'simplecov'
require 'simplecov-lcov'

SimpleCov.minimum_coverage line: 90

SimpleCov::Formatter::LcovFormatter.config do |c|
    c.report_with_single_file = true
    c.single_report_path = 'coverage/lcov.info'
end

SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
SimpleCov.start do
  add_filter(/^\/spec\//) # For RSpec
  add_filter(/^\/test\//) # For Minitest
  enable_coverage(:branch) # Report branch coverage to trigger branch-level undercover warnings
end

require 'undercover'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
