# Class: ntp
#
# This module manages ntp
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
#   [*server_options*]
#     Pass options to all servers listed in server_list
#     Default: ''
#
#   [*pool_list*]
#     List of NTP pools to use.
#     Default: []
#
#   [*pool_options*]
#     Pass options to all pools listed in pool_list
#     Default: ''
#
#   [*server_enabled*]
#     Enable ntp server mode.
#     Default: false
#
#   [*query_networks*]
#     List of networks which have unlimited access.
#     Default: []
#
#   [*interface_ignore*]
#     Ignore these interfaces.
#     Default: []
#
#   [*interface_listen*]
#     Listen on these interfaces.
#     Default: []
#
#   [*enable_statistics*]
#     Enable statistics.
#     Default: []
#
#   [*statsdir*]
#     Directory to write statistics.
#     Default: undef
#
#   [*tinker_panic*]
#     Try to get time even with large jumps in time.
#     Default: false
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
#     Only set this, if your platform is not supported or you know,
#     what you're doing.
#     Default: auto-set, platform specific
#
#   [*config_file*]
#     Main configuration file.
#     Only set this, if your platform is not supported or you know,
#     what you're doing.
#     Default: auto-set, platform specific
#
#   [*disable_monitor*]
#     Disables the monitoring facility
#     Default: false
#
#   [*config_file_replace*]
#     Replace configuration file with that one delivered with this module
#     Default: true
#
#   [*driftfile*]
#     Driftfile to use
#     Only set this, if your platform is not supported or you know,
#     what you're doing.
#     Default: auto-set, platform specific
#
#   [*service_ensure*]
#     Ensure if service is running or stopped
#     Default: running
#
#   [*service_name*]
#     Name of NTP service
#     Only set this, if your platform is not supported or you know,
#     what you're doing.
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
#   [*ntpd_start_options*]
#     Options to pass to the ntpd command.
#     Default: auto-set, platform specific
#
# Actions:
#   Installs ntp package and configures it
#
# Requires:
#   Nothing
#
# Sample Usage:
#   class { 'ntp':
#     server_enabled = true,
#   }
#
# [Remember: No empty lines between comments and class definition]
class ntp (
  String $package,
  String $config_file,
  String $driftfile,
  String $service_name,
  Enum['absent', 'present'] $ensure = 'present',
  Array $server_list = ['0.pool.ntp.org','1.pool.ntp.org','2.pool.ntp.org','3.pool.ntp.org'],
  Optional[String] $server_options = undef,
  Array $pool_list = [],
  Optional[String] $pool_options = undef,
  Boolean $server_enabled = false,
  Array $query_networks = [],
  Array $interface_ignore = [],
  Array $interface_listen = [],
  Boolean $enable_statistics = false,
  Boolean $disable_monitor = false,
  Optional[String] $statsdir = undef,
  Boolean $tinker_panic = false,
  Boolean $autoupgrade = false,
  Boolean $config_file_replace = true,
  Enum['stopped', 'running'] $service_ensure = 'running',
  Boolean $service_enable = true,
  Boolean $service_hasstatus = true,
  Boolean $service_hasrestart = true,
  Optional[Stdlib::Absolutepath] $defaults_file = undef,
  Optional[String] $defaults_file_tpl = undef,
  Optional[String] $ntpd_start_options = undef,
) {
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

      if $server_enabled == false {
        $interface_ignore_real = ['all']
        $interface_listen_real = ['lo']
      } elsif $server_enabled == true {
        $interface_ignore_real = $interface_ignore
        $interface_listen_real = $interface_listen
      } else {
        fail('server_enabled parameter must be true or false')
      }

      if $enable_statistics == true {
        if ! $statsdir {
          fail('statsdir parameter must be set, if enable_statistics is true')
        }
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

  package { $package:
    ensure => $package_ensure,
  }

  file { $config_file:
    ensure  => $ensure,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('ntp/ntp.conf.erb'),
    notify  => Service[$service_name],
    require => Package[$package],
  }

  if $defaults_file {
    file { $defaults_file:
      ensure  => $ensure,
      owner   => 0,
      group   => 0,
      mode    => '0644',
      content => template("${module_name}/${defaults_file_tpl}"),
      notify  => Service[$service_name],
      require => Package[$package],
    }
  }

  if $ensure != 'absent' {
    service { $service_name:
      ensure     => $service_ensure_real,
      enable     => $service_enable,
      hasstatus  => $service_hasstatus,
      hasrestart => $service_hasrestart,
      require    => File[$config_file],
    }
  }
}
