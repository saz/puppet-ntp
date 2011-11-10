class ntp::install {
    package { $ntp::params::package_name:
        ensure => present,
    }
}
