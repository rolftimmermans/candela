require "bundler"
Bundler.require(:default, :test)
RSpec::Core::Runner.autorun

describe "image" do
  describe "transformed" do
    describe "with zoom" do
      subject { Candela::Image.open("test/fixtures/png-24.png").zoom(4) }

      its("width") { should == 16 }
      its("height") { should == 16 }
    end

    describe "with resample" do
      # subject { Candela::Image.open("test/fixtures/diag.png").transform(Matrix[[20, 0], [0, 20]]) }
      subject { Candela::Image.open("test/fixtures/cat-small.png").transform(Candela::Transformation.resize(1.5)) }

      its("width") { should == 14 }
      its("height") { should == 14 }

      it do
        subject.save("tst.png")
      end
    end

    describe "with sharpen on lab image" do
      subject { Candela::Image.open("test/fixtures/cat-lab.tif").sharpen }

      its("width") { should == 500 }
      its("height") { should == 355 }
    end

    describe "with invert" do
      subject { Candela::Image.open("test/fixtures/png-24.png").invert }

      its("width") { should == 4 }
    end
  end
end
