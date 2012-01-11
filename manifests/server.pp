class ntp::server(
  $server_list = [
    '0.debian.pool.ntp.org',
    '1.debian.pool.ntp.org',
    '2.debian.pool.ntp.org',
    '3.debian.pool.ntp.org',
  ],
  $query_networks = [],
  $ensure = 'present',
  $autoupgrade = false,
  $package = $ntp::params::package,
  $config_file = $ntp::params::config_file,
  $config_file_replace = true,
  $service_ensure = 'running',
  $service_name = $ntp::params::service_name,
  $service_enable = true,
  $service_hasstatus = true,
  $service_hasrestart = true
) inherits ntp {

  case $ensure {
    /(present)/: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }

      if $service_ensure == 'running' {
        $service_ensure_real = $service_ensure
      } elsif $service_ensure == 'stopped' {
        $service_ensure_real = $service_ensure
      } else {
        fail('service_ensure parameter must be running or stopped')
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
      $service_ensure_real = 'stopped'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  Package[$package] {
    ensure => $package_ensure,
  }

  File[$config_file] {
    ensure  => $ensure,
    content => template('ntp/server/ntp.conf.erb'),
  }

  Service[$service_name] {
    ensure     => $service_ensure_real,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
  }
}
