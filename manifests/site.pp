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
  include chefdk
  include coreutils
  include coreutils::gnubin
  include ctags
  include dnsmasq
  include dotfiles
  include fonts::larsenwork::monoid
  include git
  include gpg
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::hide_indicator_lights
  include osx::dock::icon_size
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
  include osx::global::enable_dark_mode
  include osx::global::enable_dark_mode_shortcut
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  include osx::keyboard::capslock_to_control
  include osx::no_network_dsstores
  include osx::safari::enable_developer_mode
  include terraform
  include tmux
  include vagrant
  include vim
  include vim::vundle
  include virtualbox
  include wget
  include z
  include zsh

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  file_line { "Source boxen environment":
    path => "${home}/.zshrc",
    line => "source /opt/boxen/env.sh"
  }
}
