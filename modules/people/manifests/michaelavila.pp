class people::michaelavila {
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'michaelavila/dotfiles'
  }
}
