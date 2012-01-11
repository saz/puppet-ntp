class ntp::params {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntp'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
