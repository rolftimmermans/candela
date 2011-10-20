# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "candela/version"

Gem::Specification.new do |s|
  s.name        = "candela"
  s.version     = Candela::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rolf Timmermans"]
  s.email       = ["r.timmermans@voormedia.com"]
  s.homepage    = "https://github.com/rolftimmermans/candela"
  s.summary     = %q{Image manipulation library.}
  s.description = %q{Image manipulation library.}

  s.add_runtime_dependency "ffi"
  s.add_development_dependency "rake", ["~> 0.9"]
  s.add_development_dependency "rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
