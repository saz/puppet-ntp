class ntp::client::config {
    file { $ntp::params::config_file:
        ensure  => present,
        owner   => root,
        group   => root,
        content => template('ntp/client/ntp.conf.erb'),
        notify  => Class['ntp::client::service'],
        require => Class['ntp::install'],
    }
}
