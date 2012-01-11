# Class: ntp::client
#
# This module manages ntp-client
#
# Parameters:
#   [*server_list*]
#     List of NTP servers to use
#     Default: [ 
#       '0.debian.pool.ntp.org',
#       '1.debian.pool.ntp.org',
#       '2.debian.pool.ntp.org',
#       '3.debian.pool.ntp.org',
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
#   [*config_file_replace*]
#     Replace configuration file with that one delivered with this module
#     Default: true
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
# Actions:
#   Installs ntp package and configures it to sync to defined servers
#
# Requires:
#   Nothing
#
# Sample Usage:
#   class { 'ntp': }
#
#
# [Remember: No empty lines between comments and class definition]
class ntp::client(
  $server_list = [
    '0.debian.pool.ntp.org',
    '1.debian.pool.ntp.org',
    '2.debian.pool.ntp.org',
    '3.debian.pool.ntp.org',
  ],
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
    content => template('ntp/client/ntp.conf.erb'),
  }

  Service[$service_name] {
    ensure     => $service_ensure_real,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
  }
}
