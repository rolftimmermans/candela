module Candela
  module Vips
    class Rect < FFI::Struct
      layout(
        :left, :int,
        :top, :int,
        :width, :int,
        :height, :int
      )
    end
  end
end
