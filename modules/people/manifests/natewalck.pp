class people::natewalck {
  include people::natewalck::params
  include people::natewalck::applications
  include people::natewalck::settings::dock
  include people::natewalck::settings::finder
  include people::natewalck::settings::globalprefs
  include people::natewalck::settings::dotfiles
  include people::natewalck::settings::misc
  include people::natewalck::settings::commandline
  include people::natewalck::settings::symlinks
}
