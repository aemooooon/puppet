class bacula_storage::install {
    package { 'bacula-sd':
        ensure => present,
    }
}
