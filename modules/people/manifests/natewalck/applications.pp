class people::natewalck::applications (
  $my_homedir   = $people::natewalck::params::my_homedir,
  $my_sourcedir = $people::natewalck::params::my_sourcedir,
  $my_username  = $people::natewalck::params::my_username
) {

  include onepassword
  include chrome
  include dropbox
  include flux
  include gitx
  include iterm2::dev
  include minecraft
  include mumble
  include omnifocus 
  include spotify
  include vmware_fusion

  package { 'zsh': }

  package { 'Adium':
    source   => 'http://downloads.sourceforge.net/project/adium/Adium_1.5.4.dmg',
    provider => appdmg,
  }

  package { 'AppCleaner':
    source   => 'http://www.freemacsoft.net/downloads/AppCleaner_2.1.zip',
    provider => compressed_app,
  }

  package { 'CoRD':
    source         => 'http://iweb.dl.sourceforge.net/project/cord/cord/0.5.7/CoRD_0.5.7.zip',
    provider => compressed_app,
  }

  package { 'Crashplan':
    source           => 'http://download.crashplan.com/installs/mac/install/CrashPlan/CrashPlan_3.4.1_Mac.dmg',
    provider => pkgdmg,
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

  package { 'Skype':
    source   => 'http://download.skype.com/macosx/Skype_6.2.0.1117.dmg',
    provider => appdmg,
  }

  package { 'SublimeText3':
    source   => 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203047.dmg',
    provider => appdmg,
  }

  package { 'Tunnelblick':
    source   => 'https://tunnelblick.googlecode.com/files/Tunnelblick_3.3beta21b.dmg',
    provider => appdmg,
  }

  package { 'Zephyros':
    source => 'https://raw.github.com/sdegutis/zephyros/master/Builds/Zephyros-LATEST.app.tar.gz',
    provider => compressed_app,
  }
}
