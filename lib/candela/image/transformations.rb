module Candela
  class Image
    module Transformations
      def invert
        unary_transform("invert")
      end

      # Zoom the image by integer factors. No interpolation is performed.
      def zoom(x_factor, y_factor = x_factor)
        unary_transform("zoom", x_factor.to_i, y_factor.to_i)
      end

      def resample(factor)
        affine(Matrix.scalar(factor))
      end

      def transform(transf, options = {})
        interpolation = Vips.vips_interpolate_new((options[:interpolate] || "nohalo").to_s)
        raise TransformationError if interpolation.null?
        transf = transf * Transformation.offset(center)

        unary_transform("affinei", interpolation,
          *transf.translation, *transf.offset,
          -center.x, -center.y, width, height)
      end

      def sharpen(options = {})
        mask_size = options[:radius] || 2
        x1 = options[:flat_jaggy_threshold] || 1.5
        y2 = options[:brightening_limit] || 10
        y3 = options[:darkening_limit] || 30
        m1 = options[:flat_slope] || 1
        m2 = options[:jaggy_slope] || 2
        unary_transform("sharpen", mask_size, x1, y2, y3, m1, m2)
      end

      def add(other)
        binary_transform("add", other)
      end

      private

      def unary_transform(name, *args)
        Image.new.tap do |output|
          result = Vips.send(:"im_#{name}", to_pointer, output.to_pointer, *args)
          raise TransformationError unless result == 0

          # VIPS 8 format, doesn't work yet.
          # Vips.vips_call(name,
          #   :pointer, to_pointer,
          #   :pointer, output.to_pointer,
          #   :pointer, nil
          # )
        end
      end

      def binary_transform(name, other)
        Image.new.tap do |output|
          result = Vips.send(:"im_#{name}", to_pointer, other.to_pointer, output.to_pointer, *args)
          raise TransformationError unless result == 0

          # VIPS 8 format, doesn't work yet.
          # Vips.vips_call(name,
          #   :pointer, to_pointer,
          #   :pointer, other.to_pointer,
          #   :pointer, output.to_pointer,
          #   :pointer, nil
          # )
        end
      end
    end
  end
end
