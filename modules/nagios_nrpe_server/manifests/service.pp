#Created by BW
class nagios_nrpe_server::service {
 service { "nagios-nrpe-server" :
 ensure => running,
 hasstatus => true,
 hasrestart => true,
 enable => true,
 require => Class["nagios_nrpe_server::config"],
 }
}

