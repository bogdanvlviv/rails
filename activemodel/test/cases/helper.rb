# frozen_string_literal: true

require "active_model"

# Show backtraces for deprecated behavior for quicker cleanup.
ActiveSupport::Deprecation.debug = true

# Disable available locale checks to avoid warnings running the test suite.
I18n.enforce_available_locales = false

require "active_support/testing/autorun"

class ActiveModel::TestCase < ActiveSupport::TestCase
  private
    # Skips the current run on Rubinius using Minitest::Assertions#skip
    def rubinius_skip(message = "")
      skip message if RUBY_ENGINE == "rbx"
    end

    # Skips the current run on JRuby using Minitest::Assertions#skip
    def jruby_skip(message = "")
      skip message if defined?(JRUBY_VERSION)
    end
end
