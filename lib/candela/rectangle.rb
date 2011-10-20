module Candela
  class Rectangle
    def initialize(left, top, width, height)
      @struct = Vips::Rect.new
      @struct[:left], @struct[:top], @struct[:width], @struct[:height] = left, top, width, height
    end

    def to_pointer
      @struct.pointer
    end
  end
end
