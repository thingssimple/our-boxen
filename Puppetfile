# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.11.1"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "chefdk",      "0.0.6", :repo => "thingssimple/puppet-chefdk"
github "coreutils",   "0.0.3", :repo => "thingssimple/puppet-coreutils"
github "ctags",       "1.0.0"
github "dnsmasq",     "2.0.1"
github "dotfiles",    "0.0.6", :repo => "thingssimple/puppet-dotfiles"
github "fonts",       "0.0.5", :repo => "thingssimple/puppet-fonts"
github "gcc",         "3.0.2"
github "git",         "2.7.92"
github "gpg",         "0.0.8", :repo => "thingssimple/puppet-gpg"
github "homebrew",    "1.13.0"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "openssl",     "1.0.0"
github "osx", 	      "2.8.3", :repo => "thingssimple/puppet-osx"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.3"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "terraform",   "0.0.1", :repo => "thingssimple/puppet-terraform"
github "tmux",        "1.0.2"
github "xquartz",     "1.2.1"
github "vagrant",     "3.3.4"
github "vim",         "0.0.8", :repo => "thingssimple/puppet-vim"
github "virtualbox",  "1.0.14", :repo => "thingssimple/puppet-virtualbox"
github "wget",        "1.0.1"
github "z",           "0.0.6", :repo => "thingssimple/puppet-z"
github "zsh",         "1.0.0"
