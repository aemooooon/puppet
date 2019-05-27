class dns_update {
    file { '/etc/resolv.conf':
          owner => "root",
          group => "root",
          mode => 0440,
          source => "puppet:///modules/dns_update/resolv.conf",
      }
}
