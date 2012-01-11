# Class: ntp
#
# Base class for ntp management
#
# Parameters:
#   None
#
# Actions:
#   Base template for other ntp classes.
#
# Requires:
#   Nothing
#
# Sample Usage:
#   Only use it, if you know, what you are doing!
#
#
# [Remember: No empty lines between comments and class definition]
class ntp inherits ntp::params {

  package { $package: }

  file { $config_file:
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    require => Package[$package],
    notify  => Service[$service_name],
  }

  service { $service_name:
    require    => File[$config_file],
  }
}
