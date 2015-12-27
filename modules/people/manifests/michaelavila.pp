class people::michaelavila {
  include osx::global::enable_dark_mode
  include osx::global::enable_dark_mode_shortcut

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'michaelavila/dotfiles'
  }

  osx::recovery_message { 'If found, please email me@michaelavila.com': }
}
