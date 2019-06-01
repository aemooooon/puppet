class nrpe::config {
    file { "/etc/nagios/nrpe.cfg":
        ensure => present,
        source => "puppet:///modules/nrpe/nrpe.cfg",
        mode => 0444,
        owner => "root",
        group => "root",
        require => Class["nrpe::install"],
        notify => Class["nrpe::service"],
    }
    file{"/usr/lib/nagios/plugins/check_mem.pl":
			ensure=>present,
			source=>"puppet:///modules/nrpe/check_mem.pl",
			mode=>0755,
			owner=>"nagios",
			group=>"root",
			require=>Class["nrpe::install"],
			notify=>Class["nrpe::service"]
	}
}
