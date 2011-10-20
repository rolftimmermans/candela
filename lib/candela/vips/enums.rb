module Candela
  module Vips
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

    Intent = enum(
      :perceptual, 0,
      :relative, # colorimetric
      :saturation,
      :absolute  # colorimetric
    )

    RegionType = enum(
      :none,
      :buffer,
      :other_region,
      :other_image,
      :window
    )
  end
end
