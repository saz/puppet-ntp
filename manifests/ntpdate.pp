# Class: ntp::ntpdate
#
# This module manages ntpdate.
#
# Parameters:
#   [*server_list*]
#     List of NTP servers to use.
#     Default: [
#       '0.pool.ntp.org',
#       '1.pool.ntp.org',
#       '2.pool.ntp.org',
#       '3.pool.ntp.org',
#       ],
#
#   [*ensure*]
#     Ensure if present or absent.
#     Default: present
#
#   [*autoupgrade*]
#     Upgrade package automatically, if there is a newer version.
#     Default: false
#
#   [*package*]
#     Name of the package.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*config_file*]
#     Main configuration file.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*service_ensure*]
#     Ensure if service is running or stopped
#     Default: running
#
#   [*service_name*]
#     Name of NTP service
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*service_enable*]
#     Start service at boot
#     Default: true
#
#   [*service_hasstatus*]
#     Service has status command
#     Default: true
#
#   [*service_hasrestart*]
#     Service has restart command
#     Default: true
#
#   [*defaults_file*]
#     Init script configuration file.
#     Default: auto-set, platform specific
#
#   [*ntpdate_options*]
#     Options to pass to the ntpdate command.
#     Default: '-U ntp -s -b'
#
#   [*sync_hwclock*]
#     Whether or not to sync the hardware clock to the current time.
#     Default: false
#
# Actions:
#   Installs ntpdate package and configures it
#
# Requires:
#   Nothing
#
# Sample Usage:
#   class { 'ntp::ntpdate':
#     server_enabled = true,
#   }
#
# Authors:
#   Mike Arnold <mike@razorsedge.org>
#
# Copyright:
#   Copyright (C) 2012 Mike Arnold, unless otherwise noted.
#
class ntp::ntpdate(
  # TODO: get $server_list from Class["ntp"]
  $server_list = [
    '0.pool.ntp.org',
    '1.pool.ntp.org',
    '2.pool.ntp.org',
    '3.pool.ntp.org',
  ],
  $ensure = 'present',
  $autoupgrade = false,
  $package = $ntp::params::ntpdate_package,
  $config_file = $ntp::params::ntpdate_config_file,
  $service_ensure = 'running',
  $service_name = $ntp::params::ntpdate_service_name,
  $service_enable = true,
  $service_hasstatus = false,
  $service_hasrestart = true,
  $defaults_file = $ntp::params::ntpdate_defaults_file,
  $ntpdate_options = $ntp::params::ntpdate_options,
  $sync_hwclock = false
) inherits ntp::params {

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

  if $package {
    package { $package:
      ensure => $package_ensure,
    }
  }

  if $config_file {
    file { $config_file:
      ensure  => $ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('ntp/step-tickers.erb'),
      require => Package[$package],
      notify  => Service[$service_name],
    }
  }

  if $defaults_file {
    file { $defaults_file:
      ensure  => $ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('ntp/ntpdate.defaults.erb'),
      require => Package[$package],
      notify  => Service[$service_name],
    }
  }

  if $service_name {
    service { $service_name:
      ensure     => $service_ensure_real,
      enable     => $service_enable,
      hasstatus  => $service_hasstatus,
      hasrestart => $service_hasrestart,
      status     => '/bin/true',
    }
  }
}
