# Class: ntp
#
# This module manages ntp
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage: include ntp
#
# [Remember: No empty lines between comments and class definition]
class ntp {
    include ntp::params, ntp::install, ntp::client::config, ntp::client::service
}
