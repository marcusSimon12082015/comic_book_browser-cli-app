
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "comic_book_browser/version"

Gem::Specification.new do |spec|
  spec.name          = "comic_book_browser"
  spec.version       = ComicBookBrowser::VERSION
  spec.authors       = ["Matija Simin"]
  spec.email         = ["marcussimon12082015@hotmail.com"]

  spec.summary       = %q{Comic book releases browser}
  spec.description   = %q{Provides details for comic book releases for current week, 2 weeks in advance and 2 weeks prior.}
  spec.homepage      = "https://github.com/marcusSimon12082015/comic_book_browser-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  
  spec.executables   = ["comic_book_browser"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0"
  spec.add_development_dependency 'command_line_reporter', '>=3.0'
  spec.add_development_dependency "nokogiri", ">= 1.8"
end
