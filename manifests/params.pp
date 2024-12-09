class ntp::params {
  # Common

  case $facts['os']['family'] {
    'Debian': {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/ntp.drift'
      $defaults_file = '/etc/default/ntp'
      $defaults_file_tpl = 'ntp.defaults.debian.erb'
      $ntpd_start_options = '-g'
    }
    'RedHat': {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/drift'
      $defaults_file = '/etc/sysconfig/ntpd'
      $defaults_file_tpl = 'ntp.defaults.redhat.erb'
      case $facts['os']['name'] {
        'RedHat', 'CentOS', 'Scientific', 'SLC', 'OracleLinux', 'OVS', 'OEL': {
          $ntpd_start_options = '-u ntp:ntp -p /var/run/ntpd.pid -g'
          if versioncmp($facts['os']['release']['major'], '6') >= 0 {
            $ntpdate_package = 'ntpdate'
            $ntpdate_config_file = '/etc/ntp/step-tickers'
            $ntpdate_defaults_file = '/etc/sysconfig/ntpdate'
            $ntpdate_service_name = 'ntpdate'
            $ntpdate_options = '-U ntp -s -b'
          }
        }
        'Fedora': {
          $ntpdate_package = 'ntpdate'
          $ntpdate_config_file = '/etc/ntp/step-tickers'
          $ntpdate_defaults_file = '/etc/sysconfig/ntpdate'
          $ntpdate_service_name = 'ntpdate'
          $ntpdate_options = '-U ntp -s -b'
          $ntpd_start_options = '-p /var/run/ntpd.pid -g'
        }
        default: {
          fail("Unsupported platform: ${facts['os']['family']}/${facts['os']['name']}")
        }
      }
    }
    'Suse': {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      if versioncmp($facts['os']['release']['full'], '13.2') == 0 {
        $service_name = 'ntpd'
      } elsif $facts['os']['name'] == 'SLES' and versioncmp($facts['os']['release']['major'], '12') >= 0 {
        $service_name = 'ntpd'
      } else {
        $service_name = 'ntp'
      }
      $driftfile = '/var/lib/ntp/drift/ntp.drift'
    }
    'Gentoo': {
      $package = 'net-misc/ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/ntp.drift'
      $defaults_file = '/etc/conf.d/ntpd'
      $defaults_file_tpl = 'ntp.defaults.debian.erb'
      $ntpd_start_options = '-g'
    }
    'Archlinux': {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/ntp.drift'
    }
    default: {
      fail("Unsupported platform: ${facts['os']['family']}")
    }
  }
}
