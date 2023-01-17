# -*- encoding: utf-8 -*-
# stub: bootstrap-email 1.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-email".freeze
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stuart Yamartino".freeze]
  s.date = "2022-07-11"
  s.email = "stu@stuyam.com".freeze
  s.executables = ["bootstrap-email".freeze]
  s.files = ["bin/bootstrap-email".freeze]
  s.homepage = "https://bootstrapemail.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Bootstrap 5+ stylesheet, compiler, and inliner for responsive and consistent emails with the Bootstrap syntax you know and love. Support: command line, ruby, rails".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<htmlbeautifier>.freeze, ["~> 1.3"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
    s.add_runtime_dependency(%q<premailer>.freeze, ["~> 1.7"])
    s.add_runtime_dependency(%q<sassc>.freeze, ["~> 2.1"])
  else
    s.add_dependency(%q<htmlbeautifier>.freeze, ["~> 1.3"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
    s.add_dependency(%q<premailer>.freeze, ["~> 1.7"])
    s.add_dependency(%q<sassc>.freeze, ["~> 2.1"])
  end
end
