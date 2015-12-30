require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  include coreutils
  include coreutils::gnubin
  include ctags
  include dnsmasq
  include dotfiles
  include fonts::larsenwork::monoid
  include git
  include gpg
  include hub
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::hide_indicator_lights
  include osx::dock::icon_size
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
  include osx::global::disable_autocorrect
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  include osx::keyboard::capslock_to_control
  include osx::no_network_dsstores
  include osx::safari::disable_preload_top_hit
  include osx::safari::disable_quick_website_search
  include osx::safari::disable_search_suggestions
  include osx::safari::do_not_track
  include osx::safari::enable_developer_mode
  include osx::safari::search_engine
  include ruby
  include terraform
  include tmux
  include vagrant
  include vim
  include vim::vundle
  include virtualbox
  include wget
  include z
  include zsh

  # Useful homebrew packages
  package {
    [
      'heroku-toolbelt',
      'the_silver_searcher'
    ]:
  }

  class { 'osx::mouse::button_mode':
    mode => 2
  }

  file_line { "Source boxen environment":
    path => "${home}/.zshrc",
    line => "source /opt/boxen/env.sh"
  }
}
