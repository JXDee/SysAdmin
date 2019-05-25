#Created by BW
class nagios::config {
file { "/etc/nagios3/nagios.cfg":
ensure => present,
source => "puppet:///modules/nagios/nagios.cfg",
mode => 0775,
owner => "root",
group => "puppet",
require => Class["nagios::install"],
notify => Class["nagios::service"],
}

file { "/etc/nagios3/htpasswd.users":
ensure => present,
source => "puppet:///modules/nagios/htpasswd.users",
mode => 0775,
owner => "root",
group => "puppet",
require => Class["nagios::install"],
notify => Class["nagios::service"],
}

#nagios host for database server
nagios_host { "group06db.foo.org.nz":
target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
alias => "db",
check_period => "24x7",
max_check_attempts => 3,
check_command => "check-host-alive",
notification_interval => 30,
notification_period => "24x7",
notification_options => "d,u,r",
mode => 0444,
}

#nagios host for app server
nagios_host { "group06app.foo.org.nz":
target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
alias => "app",
check_period => "24x7",
max_check_attempts => 3,
check_command => "check-host-alive",
notification_interval => 30,
notification_period => "24x7",
notification_options => "d,u,r",
mode => 0444,
}

#nagios host for backups server
nagios_host { "group06backups.foo.org.nz":
target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
alias => "backups",
check_period => "24x7",
max_check_attempts => 3,
check_command => "check-host-alive",
notification_interval => 30,
notification_period => "24x7",
notification_options => "d,u,r",
mode => 0444,
}

#nagios host for mgmt server
nagios_host { "group06mgmt.foo.org.nz":
target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
alias => "mgmt",
check_period => "24x7",
max_check_attempts => 3,
check_command => "check-host-alive",
notification_interval => 30,
notification_period => "24x7",
notification_options => "d,u,r",
mode => 0444,
}

#nagios host group for ssh
nagios_hostgroup {'ssh-servers':
target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
alias => 'ssh Servers',
members => 'group06db.foo.org.nz, group06app.foo.org.nz, group06backups.foo.org.nz, group06mgmt.foo.org.nz',
mode => 0444,
}

#nagios service for ssh
nagios_service {'ssh':
service_description => 'ssh servers',
hostgroup_name => 'ssh-servers',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_ssh',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 5,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}

#nagios host group for mariadb
nagios_hostgroup {'mariadb-servers':
target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
alias => 'mariadb Servers',
members => 'group06db.foo.org.nz',
mode => 0444,
}

#nagios service for mariadb
nagios_service {'mysql':
service_description => 'mariadb-servers',
hostgroup_name => 'mariadb-servers',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_mysql_cmdlinecred!nagiosadmin!servicedesk',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}

#nagios host group for remote disks
nagios_hostgroup {'remote-disks':
target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
alias => 'remote disks',
members => 'group06db.foo.org.nz, group06app.foo.org.nz, group06backups.foo.org.nz',
mode => 0444,
}

#nagios service for remote disks
nagios_service {'nagios-nrpe-server':
service_description => 'Disk Space',
hostgroup_name => 'remote-disks',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_nrpe_1arg!check_hd',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}

#nagios service to check the disk space of the mgmt server
nagios_service {'check-mgmt-disk':
service_description => 'Disk Space',
host_name => 'group06mgmt.foo.org.nz',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_disk!20%!10%!/dev/disk/by-uuid/a27e7335-f53b-46a5-8ffc-0cdf8071637c',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}

#nagios host group for current users
nagios_hostgroup {'current-users':
target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
alias => 'current users',
members => 'group06db.foo.org.nz, group06app.foo.org.nz, group06backups.foo.org.nz',
mode => 0444,
}


#nagios service to check the number of currently logged in
#Warning if > 20 users, critical if > 50 users.
nagios_service  {'check-current-users':
service_description => 'Current Users',
hostgroup_name => 'current-users',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_nrpe_1arg!check_users!20!50',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}

#nagios service to check the number of currently logged in for mgmt server
#Warning if > 20 users, critical if > 50 users.
nagios_service  {'check-current-mgmt-users':
service_description => 'Current Users',
host_name => 'group06mgmt.foo.org.nz',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_users!20!50',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}

#nagios host group for total processes
nagios_hostgroup {'total-processes':
target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
alias => 'total processes',
members => 'group06db.foo.org.nz, group06app.foo.org.nz, group06backups.foo.org.nz',
mode => 0444,
}

#nagios service to check the number of currently running procs
#if > 250 processes, critical if > 400 processes.
nagios_service  {'check-total-processes':
service_description => 'Total Processes',
hostgroup_name => 'total-processes',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_nrpe_1arg!check_total_procs',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}


#nagios service to check the number of currently running procs for mgmt server
#if > 250 processes, critical if > 400 processes.
nagios_service  {'check-mgmt-total-processes':
service_description => 'Total Processes',
host_name => 'group06mgmt.foo.org.nz',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_procs!250!400',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}

#nagios host group for current load
nagios_hostgroup {'current-load':
target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
alias => 'current load',
members => 'group06db.foo.org.nz, group06app.foo.org.nz, group06backups.foo.org.nz',
mode => 0444,
}


#nagios service to check the the load on the local machine
nagios_service  {'check-currentt-load':
service_description => 'Current Load',
hostgroup_name => 'current-load',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_nrpe_1arg!check_load',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}


#nagios service to check the the load on the local machine for mgmt server
nagios_service  {'check-mgmt-load':
service_description => 'Current Load',
host_name => 'group06mgmt.foo.org.nz',
target => '/etc/nagios3/conf.d/ppt_services.cfg',
check_command => 'check_load!5.0!4.0!3.0!10.0!6.0!4.0',
max_check_attempts => 3,
retry_check_interval => 1,
normal_check_interval => 5,
check_period => '24x7',
notification_interval => 30,
notification_period => '24x7',
notification_options => 'w,u,c',
contact_groups => 'sysadmins',
mode => 0444,
}

nagios_contact { 'wendb2':
target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
alias => 'Betina Wendel',
service_notification_period => '24x7',
host_notification_period => '24x7',
service_notification_options => 'w,u,c,r',
host_notification_options => 'd,r',
service_notification_commands => 'notify-service-by-slack',
host_notification_commands => 'notify-host-by-slack',
email => 'root@localhost',
}

nagios_contact { 'dorrejx1':
target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
alias => 'Johnny Dorrepaal',
service_notification_period => '24x7',
host_notification_period => '24x7',
service_notification_options => 'w,u,c,r',
host_notification_options => 'd,r',
service_notification_commands => 'notify-service-by-slack',
host_notification_commands => 'notify-host-by-slack',
email => 'root@localhost',
mode => 0444,
}

nagios_contactgroup { 'sysadmins':
target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
alias => 'Systems Administrators',
members => 'wendb2, dorrejx1',
mode => 0444,
}

}
