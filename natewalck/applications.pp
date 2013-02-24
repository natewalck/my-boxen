class people::natewalck::applications (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
) {

  include minecraft
  include chrome
  include spotify
  include onepassword
  include macvim
  include iterm2::dev
  include dropbox
  include gitx
  include flux

  package { 'CoRD':
    source         => 'http://iweb.dl.sourceforge.net/project/cord/cord/0.5.7/CoRD_0.5.7.zip',
    provider => compressed_app,
  }

  package { 'Crashplan':
    source           => 'http://download.crashplan.com/installs/mac/install/CrashPlan/CrashPlan_3.4.1_Mac.dmg',
    provider => pkgdmg,
  }

  package { 'Adium':
    source   => 'http://downloads.sourceforge.net/project/adium/Adium_1.5.4.dmg',
    provider => appdmg,
  }

  package { 'AppCleaner':
    source   => 'http://www.freemacsoft.net/downloads/AppCleaner_2.1.zip',
    provider => compressed_app,
  }

  package { 'CyberDuck':
    source   => 'http://cyberduck.ch/Cyberduck-4.2.1.zip',
    provider => compressed_app,
  }

  package { 'GrandPerspective':
    source   => 'http://sourceforge.net/projects/grandperspectiv/files/grandperspective/1.5.1/GrandPerspective-1_5_1.dmg',
    provider => appdmg,
  }

  package { 'Keka':
    source   => 'http://www.kekaosx.com/release/Keka-1.0.3-intel.dmg',
    provider => appdmg,
  }

  package { 'owncloud':
    source   => 'http://download.owncloud.com/download/ownCloud-1.2.0.dmg',
    provider => appdmg,
  }

  package { 'Skype':
    source   => 'http://download.skype.com/macosx/Skype_6.2.0.1117.dmg',
    provider => appdmg,
  }

  package { 'Tunnelblick':
    source   => 'https://tunnelblick.googlecode.com/files/Tunnelblick_3.3beta21b.dmg',
    provider => appdmg,
  }
}
