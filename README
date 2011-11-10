# puppet-ntp

Manage NTP client and server configuration via Puppet

## How to use

### Client

#### Using Debian ntp mirrors

```
    include ntp
```

#### Using custom ntp mirrors

```
    $ntp_server = ['yourLocalServer1', 'yourLocalServer2', ]
    include ntp
```

### Server

#### Using Debian ntp mirrors

```
    include ntp::server
```

#### Using custom ntp mirrors

```
    $ntp_source_server = ['yourTimeSource1', 'yourTimeSource2', ]
    include ntp::server
```

If you want some clients with unlimited access,
you can set $ntp_query_networks in the follwing way:

```
    $ntp_source_server = ['yourTimeSource1', 'yourTimeSource2', ]
    $ntp_query_networks = ['192.168.0.0/255.255.255.0', '172.16.0.0/255.255.0.0', ]
    include ntp::server
```
