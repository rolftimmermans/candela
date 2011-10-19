require "ffi"
require File.expand_path("candela/vips", File.dirname(__FILE__))
require File.expand_path("candela/rectangle", File.dirname(__FILE__))
require File.expand_path("candela/image", File.dirname(__FILE__))
require File.expand_path("candela/pixel", File.dirname(__FILE__))
require File.expand_path("candela/region", File.dirname(__FILE__))

module Candela
  class << self
    def init
      Vips.vips_init(File.expand_path($0))
    end

    def version
      @version ||= "#{Vips.vips_version(0)}.#{Vips.vips_version(1)}.#{Vips.vips_version(2)}"
    end
  end
end
