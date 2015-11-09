module Geminus
  class Property
    include DSL

    def initialize(host, name, &blk)
      @host    = host
      @name    = name.to_s.freeze
      @geminus = {}

      instance_eval(&blk)
    end

    def path
      "#{@host}.#{@name}"
    end

    def inspect
      "#<#{self.class} path=#{path.inspect}>"
    end

    alias_method :to_s, :inspect
  end
end
