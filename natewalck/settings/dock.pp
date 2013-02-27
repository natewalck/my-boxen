class people::natewalck::settings::dock (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
  ) {

  property_list_key { 'Lower Right Hotcorner - Screen Saver':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-br-corner',
    value      => 10,
    value_type => 'integer',
    notify     => Exec['Restart the Dock'],
  }

  exec { 'Restart the Dock':
    command     => '/usr/bin/killall -HUP Dock',
    refreshonly => true,
  }

  file { 'Dock Plist':
    ensure  => file,
    require => [
                 Property_list_key['Lower Right Hotcorner - Screen Saver'],
               ],
    path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    mode    => '0600',
    notify     => Exec['Restart the Dock'],
  }

  include dockutil

  dockutil::item { 'Add Chrome':
    item     => "/Applications/Google Chrome.app",
    label    => "Google Chrome",
    position => 1,
    action   => "add",
    require  => Class['chrome'],
  }


  dockutil::item { 'Add Adium':
    item     => "/Applications/Adium.app",
    label    => "Adium",
    action   => "add",
    position => 2,
    require  => Package['Adium'],
  }

  dockutil::item { 'Add Tweetbot':
    item     => "/Applications/Tweetbot.app",
    label    => "Tweetbot",
    action   => "add",
    position => 3,
  }

  dockutil::item { 'Add Textual':
    item     => "/Applications/Textual.app",
    label    => "Textual",
    action   => "add",
    position => 4,
  }

  dockutil::item { 'Add iTerm':
    item     => "/Applications/iTerm.app",
    label    => "iTerm",
    action   => "add",
    position => 5,
    require  => Class['iterm2::dev'],
  }

}
