class nrpe::install {
	package{ "nagios-nrpe-server":
        	ensure=>present,
	}
	package{ "inotify-tools":
		ensure => present,
	}	
	user { "nagios":
		ensure => present,
	}
	group { "nagios":
		ensure => present,
	}
}
