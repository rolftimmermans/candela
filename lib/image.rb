require File.expand_path("candela", File.dirname(__FILE__))

img = Candela::Image.open("voormedia2.png")
region = img.region(0, 0, img.width, img.height)

# #.each_pixel do |pixel|
# #end
# 
# px = nil
# (0...region.height).each do |y|
#   (0...region.width).each do |x|
#     puts region[x,y].to_hex
#     px = region[x,y]
#     # if region[x, y].to_a[1] > 5
#     #   print "X"
#     # else
#     #   print " "
#     # end
#   end
#   puts
# end
# 
# region = nil
# img = nil
# GC.start
