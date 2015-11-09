require "json"

module Geminus
  autoload :DSL,        "geminus/dsl"
  autoload :Generator,  "geminus/generator"
  autoload :Property,   "geminus/property"
  autoload :Registry,   "geminus/registry"
  autoload :VERSION,    "geminus/version"

  class << self
    def included(base)
      Registry.instance << base

      base.instance_variable_set(:@geminus, {})
      base.send(:extend, DSL)
    end

    def generate
      Generator.generate
    end
  end
end
