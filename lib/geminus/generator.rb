module Geminus
  module Generator
    PREAMBLE = File.read("#{__dir__}/generator/preamble.js").freeze

    def self.generate
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
