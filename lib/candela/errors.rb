module Candela
  class Error < StandardError
    def initialize(message = nil)
      if message
        super
      else
        super Vips.vips_error_buffer.chomp.sub(/^\w+:\s+/, "")
        Vips.vips_error_clear
      end
    end
  end

  class ImageNotFound < Error
  end

  class ImageError < Error
  end

  class TransformationError < Error
  end
end
