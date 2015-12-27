class people::brianriley {
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'brianriley/dotfiles'
  }

  osx::recovery_message { 'If found, please email brian@btriley.com': }
}
