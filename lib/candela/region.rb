module Candela
  class Region
    def initialize(image)
      @image = image
      @struct = Vips::Region.new Vips.vips_region_new(image.to_ptr)
    end

    def prepare(rect)
      Vips.vips_region_prepare(@struct, rect.to_ptr)
    end

    def top
      @struct[:valid][:top]
    end

    def left
      @struct[:valid][:left]
    end

    def bytes_per_line
      @struct[:bpl]
    end

    def [](left, top)
      offset = top * bytes_per_line + left * @image.pixel_size
      Pixel.new(@struct[:data].slice(offset, @image.pixel_size), @image.band_format, @image.bands)
    end

    def to_ptr
      @struct.pointer
    end
  end
end
