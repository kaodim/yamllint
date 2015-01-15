require 'rspec'

require 'aruba'
require 'aruba/api'

require 'yamllint'

###
# Helper methods for spec tests
#
module SpecHelpers
  def spec_data(data_path)
    File.expand_path(File.join('spec/data', data_path))
  end
end

###
# Helper methods for spec tests against the CLI
#
module CliSpecHelpers
  def yamllint(args = nil)
    run_simple("#{yamllint_bin} #{args}", false)
  end

  def yamllint_bin
    File.expand_path('../../bin/yamllint', __FILE__)
  end
end

RSpec.configure do |config|
  config.include SpecHelpers
  config.include CliSpecHelpers
  config.include Aruba::Api

  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end