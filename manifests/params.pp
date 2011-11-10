class ntp::params {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $package_name = 'ntp'
            $config_file = '/etc/ntp.conf'
            $service_name = 'ntp'
        }
    }
}
