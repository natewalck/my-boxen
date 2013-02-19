class people::natewalck {
  include people::natewalck::applications
  include people::natewalck::plist-settings
  # Notfiy is for debugging purposes
  #notify { 'This is Nates stuff, mind your bidness': }
}
