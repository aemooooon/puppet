class bacula_file::service {
    service { "bacula-fd" :
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        enable => true,
        require => Class["bacula_file::config"],
    }
}
