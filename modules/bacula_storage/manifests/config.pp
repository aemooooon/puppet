class bacula_storage::config {
    file { "/etc/bacula/bacula-sd.conf":
        ensure => present,
        source => "puppet:///modules/bacula_storage/bacula-sd.conf",
        mode => 0444,
        owner => "root",
        group => "root",
        require => Class["bacula_storage::install"],
	notify => Class["bacula_storage::service"]
    }
}
