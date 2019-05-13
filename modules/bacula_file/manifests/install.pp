class bacula_file::install {
    package { 'bacula-fd':
        ensure => present,
    }
}
