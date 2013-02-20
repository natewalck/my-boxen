class people::natewalck::settings::dotfiles {

  $my_homedir = "/Users/${::luser}"

  exec { "Clone vim Settings":  
    command => "git clone --recursive https://github.com/natewalck/vim.git ${my_homedir}/.vim",
    creates => "${my_homedir}/.vim",
  }

  file { 'vim Settings':
    ensure  => directory,
    require => Exec['Clone vim Settings'],
    path => "${my_homedir}/.vim",
    mode => '600',
  }

  file { "${my_homedir}/.vimrc":
    ensure => link,
    target => "${my_homedir}/.vim/vimrc",
  }
}
