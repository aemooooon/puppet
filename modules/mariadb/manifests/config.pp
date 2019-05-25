class mariadb::config {
    file { "/etc/mysql/mariadb.conf.d/50-server.cnf":
        ensure => present,
        source => "puppet:///modules/mariadb/50-server.cnf",
        mode => 0444,
        owner => "root",
        group => "root",
        require => Class["mariadb::install"],
        notify => Class["mariadb::service"],
    }
    cron {"dumpdbfile":
        command => 'mysqldump --all-databases --add-drop-table > /home/hua/db-backup.sql',
        user => root,
        hour => 1,
        minute => 20,
        weekday => "*"
    }
}
