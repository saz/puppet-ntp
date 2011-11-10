class ntp::server {
    include ntp::params, ntp::install, ntp::server::config, ntp::server::service
}
