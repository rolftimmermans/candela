require File.expand_path("candela", File.dirname(__FILE__))

img = Candela::Image.from_file("voormedia.jpg")
region = img.region(0, 0, img.width, img.height)
(0...img.height).each do |y|
  (0...img.width).each do |x|
    puts region[x,y].to_a.inspect
    # if region[x, y].to_a[1] > 5
    #   print "X"
    # else
    #   print " "
    # end
  end
  puts
end
