class ntp::params {
  # Common

  case $::osfamily {
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
      $ntpd_start_options = '-u ntp:ntp -p /var/run/ntpd.pid -g'
      case $::operatingsystem {
        'RedHat', 'CentOS', 'Scientific', 'SLC', 'OracleLinux', 'OVS', 'OEL': {
          $majdistrelease = $::lsbmajdistrelease ? {
            ''      => regsubst($::operatingsystemrelease,'^(\d+)\.(\d+)','\1'),
            default => $::lsbmajdistrelease,
          }
          if $majdistrelease >= 6 {
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
        }
      }
    }
    'Suse': {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      $service_name = 'ntp'
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
    default: {
      fail("Unsupported platform: ${::osfamily}")
    }
  }
}
