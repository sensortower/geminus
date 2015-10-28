require "delegate"
require "singleton"

module Geminus
  class Registry < DelegateClass(Array)
    include Singleton

    def initialize
      super([])
    end
  end
end
