module Candela
  module Vips
    class GTypeInstance < FFI::Struct
      layout :g_class, :pointer
    end

    class GObject < FFI::Struct
      layout(
        :g_type_instance, GTypeInstance,
        :ref_count, :uint,
        :qdata, :pointer
      )
    end

    class VObject < FFI::Struct
      layout(
        :parent_object, GObject,
        :constructed, :int,

        :argument_table, :pointer,
        :nickname, :pointer,
        :description, :pointer,

        :preclose, :int,
        :close, :int,
        :postclose, :int
      )
    end
  end
end
