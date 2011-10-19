module Candela
  class Pixel
    def initialize(pointer, band_format, bands)
      @pointer, @band_format, @bands = pointer, band_format, bands
    end

    def length
      @bands * FFI.type_size(@band_format)
    end

    def data
      @pointer.read_bytes(length)
    end

    def to_a
      data.unpack(pack_string)
    end

    private

    def pack_string
      char = case @band_format
      when :uchar then "C"
      when :char then "c"
      when :ushort then "S_"
      when :short then "s_"
      when :uint then "S"
      when :int then "s"
      when :float then "F"
      when :complex then "FF"
      when :double then "D"
      when :dpcomplex then "DD"
      end
      char * @bands
    end
  end
end
