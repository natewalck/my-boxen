class people::natewalck::settings::globalprefs (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
  ) {

  property_list_key { 'Double Click Minimize':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
    key        => 'AppleMiniaturizeOnDoubleClick',
    value      => true,
    value_type => 'boolean',
    notify     => Exec['Restart Finder'],
  }

  file { 'GlobalPrefs Plist':
    ensure  => file,
    require => [
                 Property_list_key['Double Click Minimize'],
               ],
    path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
    mode    => '0600',
    notify     => Exec['Restart Finder'],
  }
}