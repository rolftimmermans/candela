module Candela
  module Vips
    extend FFI::Library
    ffi_lib "vips"

    class GTypeInstance < FFI::Struct
      layout :g_class, :pointer
    end

    class GObj < FFI::Struct
      layout(
        :g_type_instance, GTypeInstance,
        :ref_count, :uint,
        :qdata, :pointer
      )
    end

    class Obj < FFI::Struct
      layout(
        :parent_object, GObj,
        :constructed, :int,

        :argument_table, :pointer,
        :nickname, :pointer,
        :description, :pointer,

        :preclose, :int,
        :close, :int,
        :postclose, :int
      )
    end

    DemandStyle = enum(
      :smalltile,
      :fatstrip,
      :thinstrip,
      :any
    )

    ImageType = enum(
      :none,
      :setbuf,
      :setbuf_foreign,
      :openin,
      :mmapin,
      :mmapinrw,
      :openout,
      :partial
    )

    BandFormat = enum(
      :notset, -1,
      :uchar,
      :char,
      :ushort,
      :short,
      :uint,
      :int,
      :float,
      :complex,
      :double,
      :dpcomplex,
      :last
    )

    Coding = enum(
      :none, 0,
      :labq, 2,
      :rad, 6
    )

    Interpretation = enum(
      :multiband, 0,
      :bw, 1,
      :histogram, 10,
      :fourier, 24,
      :xyz, 12,
      :lab, 13,
      :cmyk, 15,
      :labq, 16,
      :rgb, 17,
      :ucs, 18,
      :lch, 19,
      :labs, 21,
      :srgb, 22,
      :yxy, 23,
      :rgb16, 25,
      :grey16, 26
    )

    class Image < FFI::Struct
      layout(
        :parent_object, Obj,
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

        :length, :int,
        :compression, :short,
        :level, :short,
        :bbits, :int,

        :time, :pointer,

        :hist, :string,
        :filename, :string,
        :data, :string,
        :kill, :int,

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
    end

    class Rect < FFI::Struct
      layout(
        :left, :int,
        :top, :int,
        :width, :int,
        :height, :int
      )
    end

    RegionType = enum(
      :none,
      :buffer,
      :other_region,
      :other_image,
      :window
    )

    class Region < FFI::Struct
      layout(
        :parent_object, Obj,
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
    end

    attach_function :vips_init, [:string], :int
    attach_function :vips_version, [:int], :int

    attach_function :vips_image_new_mode, [:string, :string], :pointer

    attach_function :vips_image_get_width, [:pointer], :int
    attach_function :vips_image_get_height, [:pointer], :int

    attach_function :vips_region_new, [:pointer], :pointer
    attach_function :vips_region_prepare, [:pointer, :pointer], :int
  end
end
