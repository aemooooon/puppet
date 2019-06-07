node 'group21mgmt.foo.org.nz' {
    package { 'vim': ensure => present }
    include sudo
    include nagios
    include ntp_service
    include puppetasservice
    include ssh
    include bacula_file
    include inotify
    include nrpe
}
node 'group21db.foo.org.nz' {
    package { 'vim': ensure => present }
    include sudo
    include ntp_service
    include puppetasservice
    include ssh
    include mariadb
    include nrpe
    include bacula_file
    include inotify
}
node 'group21app2.foo.org.nz' {
	package { 'vim': ensure => present}
	include sudo
	include ntp_service
	include puppetasservice
	include ssh
	include nrpe
	include bacula_file
	include inotify	
}
node 'group21app.foo.org.nz' {
    package { 'vim': ensure => present }
    include sudo
    include ntp_service
    include puppetasservice
    include ssh
    include nrpe
    include bacula_file
    include inotify
}
node 'group21backups.foo.org.nz' {
    package { 'vim': ensure => present }
    include sudo
    include ntp_service
    include puppetasservice
    include ssh
    include nrpe
    include bacula_director
    include bacula_storage
    include bacula_file
    include inotify
}
