class people::natewalck::applications {
  include minecraft
  include chrome
  include spotify
  include onepassword
  #include macvim
  include iterm2::stable
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
}
