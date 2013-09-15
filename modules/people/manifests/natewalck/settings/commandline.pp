class people::natewalck::settings::commandline (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
  ) {

    osx_chsh { $::luser:
      shell   => '/opt/boxen/homebrew/bin/zsh',
      require => Package['zsh'],
    }

    file_line { 'add zsh to /etc/shells':
      path    => '/etc/shells',
      line    => "${boxen::config::homebrewdir}/bin/zsh",
      require => Package['zsh'],
    }
}
