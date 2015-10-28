module Geminus
  module DSL
    def prop(key, val = nil, &blk)
      key = key.to_s

      if blk
        fail ArgumentError, "Pass either value or block" if val
        val = Container.new(&blk)
      end

      @geminus[key] = val

      instance_eval <<-RUBY, __FILE__, __LINE__
        def #{key}
          @geminus[#{key.inspect}]
        end
      RUBY
    end

    def generate_js
      pairs = []

      @geminus.each do |k, v|
        v = v.is_a?(Container) ? v.generate_js : JSON.dump(v)
        pairs << "#{JSON.dump k}:#{v}"
      end

      "{#{pairs.join ','}}"
    end
  end
end
