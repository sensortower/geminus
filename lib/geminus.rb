require "json"

require "geminus/version"
require "geminus/dsl"
require "geminus/container"
require "geminus/registry"

module Geminus
  PREAMBLE = File.read("#{__dir__}/geminus/preamble.js").freeze

  class << self
    def extended(base)
      Registry.instance << base

      base.instance_variable_set(:@geminus, {})
      base.send(:extend, DSL)
    end

    def generate_js
      parts = [PREAMBLE]

      Registry.instance.each do |geminus|
        data = geminus.name.split("::".freeze).reverse
          .inject(geminus.generate_js) { |a, e| "{#{JSON.dump e}:#{a}}" }
        parts << "geminus(#{data});"
      end

      "(function(world){\n#{parts.join "\n;\n".freeze}\n}(this));"
    end
  end
end
