class nagios::config {
file { "/etc/nagios3/nagios.cfg":
ensure => present,
source => "puppet:///modules/nagios/nagios.cfg",
mode => 0444,
owner => "root",
group => "root",
require => Class["nagios::install"],
notify => Class["nagios::service"],
}
file { "/etc/nagios3/htpasswd.users":
ensure => present,
source => "puppet:///modules/nagios/htpasswd.users",
mode => 0444,
owner => "root",
group => "root",
require => Class["nagios::install"],
notify => Class["nagios::service"],
}
file { "/etc/nagios3/conf.d":
ensure => present,
mode => 0775,
owner => "puppet",
group => "puppet",
require => Class["nagios::install"],
notify => Class["nagios::service"],
}
nagios_host { "group21db.foo.org.nz":
target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
alias => "db",
check_period => "24x7",
max_check_attempts => 3,
check_command => "check-host-alive",
notification_interval => 30,
notification_period => "24x7",
notification_options => "d,u,r",
mode => 0444,
}
nagios_hostgroup {'ssh-servers':
target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
alias => 'ssh Servers',
members => 'group21db.foo.org.nz, group21app.foo.org.nz, group21backups.foo.org.nz, group21mgmt.foo.org.nz',
}
nagios_service {'ssh':
service_description => 'ssh servers',
hostgroup_name => 'ssh-servers',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_ssh',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'admins',
}
}
