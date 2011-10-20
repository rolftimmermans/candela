require "candela/image/attributes"
require "candela/image/calculations"
require "candela/image/transformations"

module Candela
  class Image
    include Attributes
    include Calculations
    include Transformations

    class << self
      alias_method :from_pointer, :new
      private :from_pointer

      def open(path)
        raise ImageNotFound, %Q(file "#{path}" not found) unless File.exists?(path)
        pointer = Vips.vips_image_new_from_file(path)
        raise ImageError if pointer.null?
        from_pointer(pointer)
      end

      def new
        pointer = Vips.vips_image_new
        from_pointer(pointer)
      end
    end

    def initialize(pointer)
      @struct = Vips::Image.new(pointer)
    end

    def save(path)
      Vips.vips_image_write(@struct, path)
    end

    def region(*dimensions)
      Region.new(self).tap do |region|
        region.prepare(Rectangle.new(*dimensions))
      end
    end

    def to_pointer
      @struct.pointer
    end
  end
end
