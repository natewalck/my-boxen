class people::natewalck::settings::globalprefs (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
  ) {

  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

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
