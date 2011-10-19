module Candela
  class Image
    class << self
      def from_file(path)
        Candela.init
        new Vips.vips_image_new_mode(File.expand_path(path), "r")
      end
    end

    def initialize(pointer)
      @struct = Vips::Image.new(pointer)
    end

    def height
      Vips.vips_image_get_height(@struct)
    end

    def width
      Vips.vips_image_get_width(@struct)
    end

    def bands
      @struct[:bands]
    end

    def band_format
      @struct[:band_fmt]
    end

    def pixel_size
      bands * FFI.type_size(band_format)
    end

    def region(*dimensions)
      Region.new(self).tap do |region|
        region.prepare(Rectangle.new(*dimensions))
      end
    end

    def to_ptr
      @struct
    end
  end
end
