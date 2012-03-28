class ntp::params {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/ntp.drift'
    }
    'RedHat', 'Fedora', 'CentOS', 'Scientific', 'SLC', 'Ascendos', 'PSBM', 'OracleLinux', 'OVS', 'OEL': {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $defaults_file = '/etc/sysconfig/ntpd'
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/drift'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
