class bacula_director::config {
    file { "/etc/bacula/bacula-dir.conf":
        ensure => present,
        source => "puppet:///modules/bacula_director/bacula_director.conf",
        mode => 0444,
        owner => "root",
        group => "root",
        require => Class["bacula_director::install"],
        notify => Class["bacula_director::service"],
    }

    file { "/etc/bacula/bconsole.conf":
        ensure => present,
        source => "puppet:///modules/bacula_director/bconsole.conf",
        mode => 0444,
        owner => "root",
        group => "root",
        require => Class["bacula_director::install"]
    }
}
