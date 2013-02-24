class people::natewalck::settings::dotfiles (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
  ) {


  # Dotfile Repo
  repository { "${my_sourcedir}/dotfiles":
    source => 'natewalck/dotfiles',
  }

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

  file { "${my_homedir}/.gitconfig":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dotfiles/.gitconfig",
    require => Repository["${my_sourcedir}/dotfiles"],
    }

}
