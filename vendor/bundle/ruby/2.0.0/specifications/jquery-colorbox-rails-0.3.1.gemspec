# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jquery-colorbox-rails"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Krzysztof Knapik"]
  s.date = "2015-07-16"
  s.description = "jQuery Colorbox [https://github.com/jackmoore/colorbox] integration for Rails 3.1+ asset pipeline"
  s.email = ["knapo@knapo.net"]
  s.homepage = "https://github.com/knapo/jquery-colorbox-rails"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "jquery-colorbox-rails"
  s.rubygems_version = "2.0.14"
  s.summary = "jQuery Colorbox integration for Rails 3.1+ asset pipeline"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, ["<= 5.0", ">= 3.1"])
    else
      s.add_dependency(%q<railties>, ["<= 5.0", ">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>, ["<= 5.0", ">= 3.1"])
  end
end
