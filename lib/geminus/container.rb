module Geminus
  class Container
    include DSL

    def initialize(&blk)
      @geminus = {}
      instance_eval(&blk)
    end
  end
end
