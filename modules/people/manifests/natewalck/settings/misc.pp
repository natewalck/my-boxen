class people::natewalck::settings::misc (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
  ) {

  property_list_key { 'Show Battery Percent':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.menuextra.battery.plist",
    key        => 'ShowPercent',
    value      => 'YES',
    value_type => 'string',
    notify     => Exec['Restart SystemUIServer'],
  }

    exec { 'Restart SystemUIServer':
    command     => '/usr/bin/killall -HUP SystemUIServer',
    refreshonly => true,
  }

    file { 'Battery Plist':
    ensure  => file,
    require => [
                 Property_list_key['Show Battery Percent'],
               ],
    path    => "${my_homedir}/Library/Preferences/com.apple.menuextra.battery.plist",
    mode    => '0600',
    notify     => Exec['Restart SystemUIServer'],
  }
}
