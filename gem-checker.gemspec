# frozen_string_literal: true

require_relative "lib/gem_checker/version"

Gem::Specification.new do |spec|
  spec.name = "gem-checker"
  spec.version = GemChecker::VERSION
  spec.authors = ["sykez"]
  spec.email = ["hello@sykez.com"]

  spec.summary = "Checks for outdated gems in your Gemfile.lock file."
  spec.description = spec.summary
  spec.homepage = "https://github.com/sykezz/gem-checker"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.1.9"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sykezz/gem-checker"
  spec.metadata["changelog_uri"] = "https://github.com/sykezz/gem-checker/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ spec/ features/ .git .github Gemfile])
    end
  end
  spec.bindir = "bin"
  spec.executables = ['gem_checker']
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 1.17"

  spec.add_development_dependency "byebug", ">= 3.0"
  spec.add_development_dependency "rspec", ">= 3.0"
  spec.add_development_dependency "rubocop", ">= 0.42"
end
