class bacula_director::service {
    service { "bacula-director" :
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        enable => true,
        require => Class["bacula_director::config"],
    } 
}
