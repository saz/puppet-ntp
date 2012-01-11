class ntp::params {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/ntp.drift'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
