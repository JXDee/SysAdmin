#created by BW
class nagios_nrpe_server::config {
 file { "/etc/nagios/nrpe.cfg":
 ensure => present,
 source => "puppet:///modules/nagios_nrpe_server/nrpe.cfg",
 mode => 0664,
 owner => "root",
 group => "root",
 require => Class["nagios_nrpe_server::install"],
 notify => Class["nagios_nrpe_server::service"],
 }
}
