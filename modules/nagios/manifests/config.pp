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
    nagios_host { "group21app.foo.org.nz":
        target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
        alias => "app",
        check_period => "24x7",
        max_check_attempts => 3,
        check_command => "check-host-alive",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "d,u,r",
        mode => 0444,
    }
    nagios_host { "group21backups.foo.org.nz":
        target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
        alias => "backups",
        check_period => "24x7",
        max_check_attempts => 3,
        check_command => "check-host-alive",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "d,u,r",
        mode => 0444,
    }
    nagios_host { "group21mgmt.foo.org.nz":
        target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
        alias => "mgmt",
        check_period => "24x7",
        max_check_attempts => 3,
        check_command => "check-host-alive",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "d,u,r",
        mode => 0444,
    }
    nagios_hostgroup { 'ssh-servers':
        target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
        alias => 'ssh Servers',
        members => 'group21db.foo.org.nz, group21app.foo.org.nz, group21backups.foo.org.nz, group21mgmt.foo.org.nz',
        mode => 0444,
    }
    nagios_service { 'ssh':
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
        mode => 0444,
    }
    nagios_hostgroup { 'db-servers':
        target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
        alias => 'db Servers',
        members => 'group21db.foo.org.nz',
        mode => 0444,
    }
    nagios_service { 'db':
        service_description => 'database servers',
        hostgroup_name => 'db-servers',
        target => '/etc/nagios3/conf.d/ppt_services.cfg',
        check_command => 'check_mysql_cmdlinecred!nagios!abc',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'admins',
        mode => 0444,
    }
    nagios_hostgroup { 'file-check':
        target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
        alias => 'file check',
        members => 'group21db.foo.org.nz, group21app.foo.org.nz, group21backups.foo.org.nz, group21mgmt.foo.org.nz',
        mode => 0444,
    }
    nagios_service { 'file_check':
        service_description => 'file check',
        hostgroup_name => 'file-check',
        target => '/etc/nagios3/conf.d/ppt_services.cfg',
        check_command => 'check_filechange!/var/log/inotify/inotify.log!/etc/,/home/',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'admins',
        mode => 0444,
    }
    nagios_hostgroup { 'remote-disks':
        target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
        alias => 'Remote Disks',
        members => 'group21db.foo.org.nz, group21app.foo.org.nz, group21backups.foo.org.nz',
        mode => 0444,
    }
    nagios_service { 'diskcheck':
        service_description => 'remote disk check',
        hostgroup_name => 'remote-disks',
        target => '/etc/nagios3/conf.d/ppt_services.cfg',
        check_command => 'check_nrpe_1arg!check_sda1',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'admins',
        mode => 0444,
    }
   nagios_hostgroup { 'remote-http':
        target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
        alias => 'Remote HTTP',
        members => 'group21app.foo.org.nz',
        mode => 0444,
    } 
    nagios_service { 'httpcheck':
        service_description => 'remote http check',
        hostgroup_name => 'remote-http',
        target => '/etc/nagios3/conf.d/ppt_services.cfg',
        check_command => 'check_http',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'admins',
        mode => 0444,
    }
    nagios_contact { 'wangh21':
        target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
        alias => 'Hua Wang',
        service_notification_period => '24x7',
        host_notification_period => '24x7',
        service_notification_options => 'w,u,c,r',
        host_notification_options => 'd,r',
        service_notification_commands => 'notify-service-by-slack',
        host_notification_commands => 'notify-host-by-slack',
        email => 'root@localhost',
	mode => 0444,
    }
    nagios_contact { 'kiselv1':
        target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
        alias => 'Kiselv',
        service_notification_period => '24x7',
        host_notification_period => '24x7',
        service_notification_options => 'w,u,c,r',
        host_notification_options => 'd,r',
        service_notification_commands => 'notify-service-by-slack',
        host_notification_commands => 'notify-host-by-slack',
        email => 'root@localhost',
	mode => 0444,
    }
    nagios_contactgroup { 'sysadmins':
        target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
        alias => 'Nagios Administrators',
        members => 'wangh21, kiselv1',
	mode => 0444,
    }
}
