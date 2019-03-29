node 'group06db.foo.org.nz' {
package { 'vim': ensure => present }
include sudo
include ntp_service
include mariadb
include puppet_agent
include ssh
include remove_resolvconf
}

node 'group06mgmt.foo.org.nz' {
package { 'vim': ensure => present }
include sudo
include ntp_service
include puppet_agent
include ssh
include remove_resolvconf
include nagios
}

node 'group06app.foo.org.nz' {
package { 'vim': ensure => present }
include sudo
include ntp_service
include puppet_agent
include ssh
include remove_resolvconf
}

node 'group06backups.foo.org.nz' {
package { 'vim': ensure => present }
include sudo
include ntp_service
include puppet_agent
include ssh
include remove_resolvconf
}


