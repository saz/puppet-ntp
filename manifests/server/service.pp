class ntp::server::service {
    service { $ntp::params::service_name:
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
        require    => Class['ntp::server::config'],
    }
}
