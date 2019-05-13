class bacula_file::config {
    file { "/etc/bacula/bacula-fd.conf":
        ensure => present,
        source => "puppet:///modules/bacula_file/bacula-fd.conf",
        mode => 0444,
        owner => "root",
        group => "root",
        require => Class["bacula_file::install"],
	notify => Class["bacula_file::service"]
    }
}
