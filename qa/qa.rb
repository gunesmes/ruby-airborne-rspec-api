# frozen_string_literal: true

$: << File.expand_path(__dir__)

Encoding.default_external = 'UTF-8'

module QA
  ##
  # Helper classes to represent frequently used sequences of actions
  # (e.g., login)
  #
  # QA runtime classes, mostly singletons.
  #
  module Runtime
    autoload :Logger, 'runtime/logger'
    autoload :Env, 'runtime/env'

    module API
      autoload :Client, 'runtime/api/client'
      autoload :Address, 'runtime/api/address'
    end
  end
end