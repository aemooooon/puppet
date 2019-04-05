node 'group21mgmt.foo.org.nz' {
    package { 'vim': ensure => present }
    include sudo
    include nagios
    include ntp_service
    include puppetasservice
    include ssh
}
node 'group21db.foo.org.nz' {
    package { 'vim': ensure => present }
    include sudo
    include ntp_service
    include puppetasservice
    include ssh
    include mariadb
}
node 'group21app.foo.org.nz' {
    package { 'vim': ensure => present }
    include sudo
    include ntp_service
    include puppetasservice
    include ssh
}
node 'group21backups.foo.org.nz' {
    package { 'vim': ensure => present }
    include sudo
    include ntp_service
    include puppetasservice
    include ssh
}
