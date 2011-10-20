require "matrix"

module Candela
  class Point
    class << self
      alias_method :[], :new
    end

    attr_reader :x, :y

    def initialize(x, y)
      @x, @y = x, y
    end

    def vector
      Vector[x, y, 1]
    end

    def inspect
      "(#{x}, #{y})"
    end
  end
end
