class ntp::server::config {
    file { $ntp::params::config_file:
        ensure  => present,
        owner   => root,
        group   => root,
        content => template('ntp/server/ntp.conf.erb'),
        notify  => Class['ntp::server::service'],
        require => Class['ntp::install'],
    }
}
