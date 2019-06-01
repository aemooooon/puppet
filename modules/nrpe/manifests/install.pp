class nrpe::install {
	package{ "nagios-nrpe-server":
        	ensure=>present,
		require=>User["nagios"],
	}	
	user { "nagios":
		ensure => present,
		require=>Group["nagios"],
	}
	group { "nagios":
		ensure => present,
	}
}
