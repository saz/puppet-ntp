class ntp::params {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/ntp.drift'
    }
    "RedHat", "Fedora", "CentOS", "Scientific", "SLC", "Ascendos", "PSBM", "OracleLinux", "OVS", "OEL": {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/drift'

      $ntpdate_package = 'ntpdate'
      $ntpdate_config_file = '/etc/ntp/step-tickers'
      $ntpdate_defaults_file = '/etc/sysconfig/ntpdate'
      $ntpdate_service_name = 'ntpddate'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
