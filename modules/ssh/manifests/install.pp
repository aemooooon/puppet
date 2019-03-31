class ssh::install {
	package { "ssh":
	ensure => present,
	require => User["sshd"],
}
user { "sshd":
	ensure => present,
	comment => "ssh daemon user",
	gid => "ssh",
	shell => "/usr/sbin/nologin",
	require => Group["ssh"], 
}
group { "ssh":
	ensure => present,
}
}

