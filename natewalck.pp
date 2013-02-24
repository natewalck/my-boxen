class people::natewalck {
  include people::natewalck::params
  include people::natewalck::applications
  include people::natewalck::settings::dock
  include people::natewalck::settings::finder
  include people::natewalck::settings::globalprefs
  include people::natewalck::settings::dotfiles
  # Notfiy is for debugging purposes
  #notify { 'This is Nates stuff, mind your bidness': }
}
