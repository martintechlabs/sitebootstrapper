# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sitebootstrapper}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gustavo Gonzalez"]
  s.date = %q{2011-04-25}
  s.description = %q{The Description}
  s.email = %q{gustavo@martintechlabs.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README",
    "README.rdoc"
  ]
  s.files = [
    "app/controllers/admin/admin_controller.rb",
    "app/controllers/admin/users_controller.rb",
    "app/controllers/application_controller.rb",
    "app/controllers/home_controller.rb",
    "app/controllers/users/omniauth_callbacks_controller.rb",
    "app/controllers/users/registrations_controller.rb",
    "app/models/authentication.rb",
    "app/models/user.rb",
    "app/views/admin/users/index.haml",
    "app/views/devise/confirmations/new.html.haml",
    "app/views/devise/mailer/confirmation_instructions.html.haml",
    "app/views/devise/mailer/reset_password_instructions.html.haml",
    "app/views/devise/mailer/unlock_instructions.html.haml",
    "app/views/devise/passwords/edit.html.haml",
    "app/views/devise/passwords/new.html.haml",
    "app/views/devise/registrations/edit.html.haml",
    "app/views/devise/registrations/new.html.haml",
    "app/views/devise/sessions/new.html.haml",
    "app/views/devise/shared/_links.haml",
    "app/views/devise/unlocks/new.html.haml",
    "app/views/home/index.html.haml",
    "app/views/layouts/sitebootstrapper.html.haml",
    "app/views/users/registrations/edit.html.haml",
    "app/views/users/registrations/new.html.haml",
    "config/initializers/default_mailer.rb",
    "config/initializers/devise.rb",
    "config/locales/devise.en.yml",
    "config/routes.rb",
    "lib/generators/sitebootstrapper/sitebootstrapper_generator.rb",
    "lib/generators/sitebootstrapper/templates/migration.rb",
    "lib/generators/sitebootstrapper/templates/omniauth.rb",
    "lib/generators/sitebootstrapper/views_generator.rb",
    "lib/sitebootstrapper.rb",
    "lib/sitebootstrapper/engine.rb",
    "public/images/default_user.png"
  ]
  s.homepage = %q{https://github.com/martintechlabs/sitebootstrapper}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{The summary}
  s.test_files = [
    "test/helper.rb",
    "test/test_sitebootstrapper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<devise>, [">= 0"])
      s.add_runtime_dependency(%q<dynamic_form>, [">= 0"])
      s.add_runtime_dependency(%q<paperclip>, [">= 0"])
      s.add_runtime_dependency(%q<will_paginate>, ["~> 3.0.pre2"])
      s.add_runtime_dependency(%q<faraday>, ["= 0.5.7"])
      s.add_runtime_dependency(%q<oa-oauth>, [">= 0"])
      s.add_runtime_dependency(%q<oa-openid>, [">= 0"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
    else
      s.add_dependency(%q<devise>, [">= 0"])
      s.add_dependency(%q<dynamic_form>, [">= 0"])
      s.add_dependency(%q<paperclip>, [">= 0"])
      s.add_dependency(%q<will_paginate>, ["~> 3.0.pre2"])
      s.add_dependency(%q<faraday>, ["= 0.5.7"])
      s.add_dependency(%q<oa-oauth>, [">= 0"])
      s.add_dependency(%q<oa-openid>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 0"])
    end
  else
    s.add_dependency(%q<devise>, [">= 0"])
    s.add_dependency(%q<dynamic_form>, [">= 0"])
    s.add_dependency(%q<paperclip>, [">= 0"])
    s.add_dependency(%q<will_paginate>, ["~> 3.0.pre2"])
    s.add_dependency(%q<faraday>, ["= 0.5.7"])
    s.add_dependency(%q<oa-oauth>, [">= 0"])
    s.add_dependency(%q<oa-openid>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 0"])
  end
end

