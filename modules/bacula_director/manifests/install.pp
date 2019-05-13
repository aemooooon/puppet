class bacula_director::install {
    package { 'bacula-server':
        ensure => present,
    }
    package { 'bacula-console':
        ensure => present,
    }
}
