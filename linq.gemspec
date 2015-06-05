# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linq/version'

Gem::Specification.new do |spec|
  spec.name          = "linq"
  spec.version       = Linq::VERSION
  spec.authors       = ["Marat Khusnetdinov"]
  spec.email         = ["marat@khusnetdinov.ru"]

  spec.summary       = %q{Language-Integrated Query (LINQ)}
  spec.description   = %q{LINQ introduces standard, easily-learned patterns for querying and updating data, and the technology can be extended to support potentially any kind of data store.}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
