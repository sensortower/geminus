module Geminus
  module DSL
    def property(key, val = nil, &blk)
      key = key.to_s.freeze

      if blk
        fail ArgumentError, "Pass either value or block" if val
        val = Property.new(self, key, &blk)
      end

      @geminus[key] = val

      instance_eval <<-RUBY, __FILE__, __LINE__
        def #{key}
          @geminus[#{key.inspect}.freeze]
        end
      RUBY
    end

    def generate_js
      pairs = []

      @geminus.each do |k, v|
        v = v.is_a?(Property) ? v.generate_js : JSON.dump(v)
        pairs << "#{JSON.dump k}:#{v}"
      end

      "{#{pairs.join ','}}"
    end
  end
end
