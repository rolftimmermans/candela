module Candela
  module Vips
    class Region < FFI::ManagedStruct
      layout(
        :parent_object, VObject,
        :image, :pointer,

        :valid, Rect,
        :region_type, RegionType,

        :data, :pointer,

        :bpl, :int,
        :seq, :pointer,
        :gthread, :pointer,
        :window, :pointer,
        :buffer, :pointer,
        :invalid, :int
      )

      def self.release(pointer)
        Vips.g_object_unref(pointer)
      end
    end
  end
end
