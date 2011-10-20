require "ffi"

module Candela
  module Vips
    # For an API reference of libvips see:
    # http://www.vips.ecs.soton.ac.uk/supported/current/doc/html/libvips/index.html
    extend FFI::Library
    ffi_lib "vips"

    # Suppress all warnings from vips.
    ENV["IM_WARNING"] = "0"

    require "candela/vips/gobject"
    require "candela/vips/enums"
    require "candela/vips/image"
    require "candela/vips/rect"
    require "candela/vips/region"
    require "candela/vips/interpolate"

    attach_function :g_object_new, [], :pointer
    attach_function :g_object_unref, [:pointer], :void

    attach_function :vips_init, [:string], :int
    attach_function :vips_version, [:int], :int

    attach_function :vips_error_buffer, [], :string
    attach_function :vips_error_clear, [], :void

    attach_function :vips_image_new, [], :pointer
    attach_function :vips_image_new_mode, [:string, :string], :pointer
    attach_function :vips_image_new_from_file, [:string], :pointer
    attach_function :vips_image_new_disc_temp, [:string], :pointer

    attach_function :vips_image_write, [:pointer, :string], :int

    attach_function :vips_image_get_width, [:pointer], :int
    attach_function :vips_image_get_height, [:pointer], :int
    attach_function :vips_image_get_bands, [:pointer], :int
    attach_function :vips_image_ispartial, [:pointer], :int

    attach_function :vips_region_new, [:pointer], :pointer
    attach_function :vips_region_prepare, [:pointer, :pointer], :int

    attach_function :im_invert, [:pointer, :pointer], :int
    attach_function :im_zoom, [:pointer, :pointer, :int, :int], :int
    attach_function :im_sharpen, [:pointer, :pointer, :int, :double, :double, :double, :double, :double], :int
    attach_function :im_affinei, [:pointer, :pointer, Interpolate, :double, :double, :double, :double, :double, :double, :int, :int, :int, :int], :int
    attach_function :im_icc_import_embedded, [:pointer, :pointer, Intent], :int

    attach_function :vips_interpolate_nearest_static, [], :pointer
    attach_function :vips_interpolate_new, [:string], :pointer

    class << self
      def init
        Vips.vips_init(File.expand_path($0))
      end

      def lib_version
        [Vips.vips_version(0), Vips.vips_version(1), Vips.vips_version(2)]
      end
    end

    # TODO: Initialize lazily when images are opened.
    init
  end
end
