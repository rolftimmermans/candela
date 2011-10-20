# Transformation matrices.
# http://www.willamette.edu/~gorr/classes/GeneralGraphics/Transforms/transforms2d.htm
require "matrix"

module Candela
  class Transformation
    class << self
      def resize(scalar)
        new Matrix.diagonal(scalar, scalar, 1)
      end

      def rotate(angle)
        new Matrix[[Math.cos(angle), Math.sin(angle), 0], [-Math.sin(angle), Math.cos(angle), 0], [0, 0, 1]]
      end

      def offset(point)
        new Matrix[[1, 0, -point.x], [0, 1, -point.y], [0, 0, 1]]
      end
    end

    attr_reader :matrix

    def initialize(matrix)
      @matrix = matrix
    end

    def *(other)
      case other
      when Transformation
        self.class.new(matrix * other.matrix)
      when Point
        vector = matrix * other.vector
        Point.new(vector[0], vector[1])
      end
    end

    def translation
      [matrix[0, 0], matrix[0, 1], matrix[1, 0], matrix[1, 1]]
    end

    def offset
      [matrix[0, 2], matrix[1, 2]]
    end
  end
end
