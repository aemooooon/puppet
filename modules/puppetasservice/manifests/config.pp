class puppetasservice::config {
file { "/etc/puppet/puppet.conf":
ensure => present,
source => "puppet:///modules/puppetasservice/puppet.conf",
mode => 0444,
owner => "root",
group => "root",
require => Class["puppetasservice::install"],
notify => Class["puppetasservice::service"],
}
}
