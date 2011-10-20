module Candela
  class Image
    module Attributes
      def width
        Vips.vips_image_get_width(@struct)
      end

      def height
        Vips.vips_image_get_height(@struct)
      end

      def channels
        Vips.vips_image_get_bands(@struct)
      end
      alias_method :bands, :channels

      def channel_size
        FFI.type_size(band_format)
      end
      alias_method :band_size, :channel_size

      def band_format
        @struct[:band_fmt]
      end
    end
  end
end
