node 'group21db.foo.org.nz' {
  package { 'vim': ensure => present }
}
node 'group21app.foo.org.nz' {
  package { 'vim': ensure => present }
}
node 'group21backups.foo.org.nz' {
  package { 'vim': ensure => present }
}
node 'group21mgmt.foo.org.nz' {
  package { 'vim': ensure => present }
}

include sudo
include ntp_service
include mariadb
include puppetasservice
include ssh
include nagios
