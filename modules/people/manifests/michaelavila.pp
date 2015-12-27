class people::michaelavila {
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'michaelavila/dotfiles'
  }

  osx::recovery_message { 'If found, please email me@michaelavila.com': }
}
