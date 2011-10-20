require "bundler"
Bundler.require(:default, :test)
RSpec::Core::Runner.autorun

describe "image" do
  describe "from incorrect file name" do
    it do
      lambda { Candela::Image.open("does-not-exist") }.should raise_error(
        Candela::ImageNotFound,
        'file "does-not-exist" not found')
    end
  end

  describe "from empty file" do
    it do
      lambda { Candela::Image.open("test/fixtures/empty") }.should raise_error(
        Candela::ImageError,
        'file "test/fixtures/empty" not a known format')
    end
  end

  describe "from 8 bit png file" do
    subject { Candela::Image.open("test/fixtures/png-8.png") }

    its("class") { should == Candela::Image }
    its("width") { should == 4 }
    its("height") { should == 4 }
    its("channels") { should == 1 }
    its("channel_size") { should == 1 }
    its("band_format") { should == :uchar }
    its("pixel_size") { should == 1 }
  end

  describe "from 24 bit png file" do
    subject { Candela::Image.open("test/fixtures/png-24.png") }

    its("class") { should == Candela::Image }
    its("width") { should == 4 }
    its("height") { should == 4 }
    its("channels") { should == 3 }
    its("channel_size") { should == 1 }
    its("band_format") { should == :uchar }
    its("pixel_size") { should == 3 }
  end

  describe "from 32 bit png file" do
    subject { Candela::Image.open("test/fixtures/png-32.png") }

    its("class") { should == Candela::Image }
    its("width") { should == 4 }
    its("height") { should == 4 }
    its("channels") { should == 4 }
    its("channel_size") { should == 1 }
    its("band_format") { should == :uchar }
    its("pixel_size") { should == 4 }
  end

  describe "from 64 bit png file" do
    subject { Candela::Image.open("test/fixtures/png-64.png") }

    its("class") { should == Candela::Image }
    its("width") { should == 4 }
    its("height") { should == 4 }
    its("channels") { should == 4 }
    its("channel_size") { should == 2 }
    its("band_format") { should == :ushort }
    its("pixel_size") { should == 8 }
  end

  describe "from scratch" do
    subject { Candela::Image.new }

    its("class") { should == Candela::Image }
  end
end
