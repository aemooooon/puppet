class puppetasservice::install {
user { "puppet":
ensure => present,
comment => "Puppet user",
gid => "puppet",
shell => "/bin/false",
require => Group["puppet"],
}
group { "puppet" :
ensure => present,
}
}
