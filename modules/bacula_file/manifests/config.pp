class bacula_file::config {
    file { "/etc/bacula/bacula-fd.conf":
        ensure => present,        
	content => template("bacula_file/bacula-fd.conf.erb"),
        mode => 0444,
        owner => "root",
        group => "root",
        require => Class["bacula_file::install"],
	notify => Class["bacula_file::service"]
    }
}
