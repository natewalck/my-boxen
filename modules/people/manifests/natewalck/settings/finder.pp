class people::natewalck::settings::finder  (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
  ) {

  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library

  exec { 'Restart Finder':
    command     => '/usr/bin/killall -HUP Finder',
    refreshonly => true,
  }

}
