module Candela
  class Image
    module Calculations
      def pixel_size
        bands * band_size
      end

      def center
        Point[width / 2.0, height / 2.0]
      end
    end
  end
end
