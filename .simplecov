require 'simplecov'
require 'simplecov-lcov'

# a minimum line coverage of 90%
SimpleCov.minimum_coverage line: 90

SimpleCov::Formatter::LcovFormatter.config do |c|
    c.report_with_single_file = true
    c.single_report_path = 'coverage/lcov.info'
end
SimpleCov.start

# SimpleCov::Formatter::LcovFormatter.config do |c|
#   c.single_report_path = './coverage/lcov.info'
# end
# SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
# SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
# SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
#   [
#     SimpleCov::Formatter::HTMLFormatter,
#     SimpleCov::Formatter::LcovFormatter,
#   ]
# )
# SimpleCov.start