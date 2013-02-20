class people::natewalck::settings::finder {

  $my_homedir = "/Users/${::luser}"

  property_list_key { 'Show External Drives':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.finder.plist",
    key        => 'ShowExternalHardDrivesOnDesktop',
    value      => true,
    value_type => 'boolean',
    notify     => Exec['Restart Finder'],
  }

  property_list_key { 'Show Hard Drives':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.finder.plist",
    key        => 'ShowHardDrivesOnDesktop',
    value      => true,
    value_type => 'boolean',
    notify     => Exec['Restart Finder'],
  }

  exec { 'Restart Finder':
    command     => '/usr/bin/killall -HUP Finder',
    refreshonly => true,
  }

  file { 'Finder Plist':
    ensure  => file,
    require => [
                 Property_list_key['Show External Drives'],
                 Property_list_key['Show Hard Drives'],
               ],
    path    => "${my_homedir}/Library/Preferences/com.apple.finder.plist",
    mode    => '0600',
    notify     => Exec['Restart Finder'],
  }
}
