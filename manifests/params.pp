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
      case $::operatingsystem {
        'RedHat', 'CentOS', 'Scientific', 'SLC', 'OracleLinux', 'OVS', 'OEL': {
          $majdistrelease = $::lsbmajdistrelease ? {
            undef   => regsubst($::operatingsystemrelease,'^(\d+)\.[\d.]+','\1'),
            default => $::lsbmajdistrelease,
          }
          $ntpd_start_options = '-u ntp:ntp -p /var/run/ntpd.pid -g'
          if versioncmp($majdistrelease, 6) >= 0 {
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
      }
    }
    'Suse': {
      $package = 'ntp'
      $config_file = '/etc/ntp.conf'
      if versioncmp($::operatingsystemrelease, '13.2') == 0 {
        $service_name = 'ntpd'
      } elsif $::operatingsystem == 'SLES' and versioncmp($::operatingsystemmajrelease, '12') >= 0 {
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
      fail("Unsupported platform: ${::osfamily}")
    }
  }
}
