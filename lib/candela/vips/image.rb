module Candela
  module Vips
    class Image < FFI::ManagedStruct
      layout(
        :parent_object, VObject,

        :x_size, :int,
        :y_size, :int,
        :bands, :int,

        :band_fmt, BandFormat,
        :coding, Coding,
        :type, Interpretation,
        :x_res, :float,
        :y_res, :float,

        :x_offset, :int,
        :y_offset, :int,

        :__length, :int,
        :__compression, :short,
        :__level, :short,
        :__bbits, :int,

        :__time, :pointer,

        :__hist, :string,
        :__filename, :string,
        :__data, :string,
        :__kill, :int,

        :mode, :string,
        :dtype, ImageType,
        :fd, :int,
        :baseaddr, :pointer,
        :length, :size_t,
        :magic, :uint32,

        :start, :pointer,
        :generate, :int,
        :stop, :int,
        :client1, :pointer,
        :client2, :pointer,
        :sslock, :pointer,
        :regions, :pointer,
        :dhint, DemandStyle,

        :meta, :pointer,
        :meta_traverse, :pointer,

        :sizeof_header, :int,

        :windows, :pointer,

        :upstream, :pointer,
        :downstream, :pointer,
        :serial, :int,

        :history_list, :pointer,

        :progress_signal, :pointer,

        :file_length, :int64,

        :hint_set, :int,

        :delete_on_close, :int,
        :delete_on_close_filename, :string
      )

      def self.release(pointer)
        Vips.g_object_unref(pointer)
      end
    end
  end
end
