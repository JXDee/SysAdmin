node 'group06db.foo.org.nz' {
include apt-get
include sudo
include users
include dhclient
include ntp_service
include mariadb
include puppet_agent
include ssh
include remove_resolvconf
include aliases
include vim
include nagios_nrpe_server
include bacula_file

}

node 'group06mgmt.foo.org.nz' {
include apt-get
include sudo
include users
include dhclient
include ntp_service
include puppet_agent
include ssh
include remove_resolvconf
include nagios
include aliases
include vim
include nagios_plugins
include bacula_file
}

node 'group06app.foo.org.nz' {
include sudo
include apt-get
include sudo
include users
include dhclient
include ntp_service
include puppet_agent
include ssh
include remove_resolvconf
include aliases
include vim
include nagios_nrpe_server
include bacula_file

}

node 'group06backups.foo.org.nz' {
include sudo
include apt-get
include sudo
include users
include dhclient
include ntp_service
include puppet_agent
include ssh
include remove_resolvconf
include aliases
include vim
include nagios_nrpe_server
include bacula_director
include bacula_file
include bacula_storage
}


