#created by BW
class users::config {
exec {'create_group06':
path => '/bin:/usr/sbin:/usr/bin',
command => 'groupadd group06',
unless => "grep 'group06' /etc/group",
}

user { "admin":
  ensure => present,
  managehome => true,
#  password => "P@ssw0rd",  
  shell => "/bin/bash",
  home => "/home/admin",
  groups => ["sudo","group06"],
  }

#user { "wendb2":
#  ensure => present,
#  managehome => true,
#   password => "P@ssw0rd",
#  shell => "/bin/bash",
#  home => "/home/wendb2",
#  groups => ["sudo","group06"],
#  }

#user { "dorrejx1":
#  ensure => present,
#  managehome => true,
#  password => "P@ssw0rd",
#  shell => "/bin/bash",
#  home => "/home/dorrejx1",
#  groups => ["sudo","group06"],
#  }

user { "student":
  ensure => absent,
  }

#exec { "chage":
#  command => "chage -d 0 admin",
#  path => "/usr/bin:/usr/sbin:/bin",
#  onlyif => "egrep -q  -e ':admin!!:' -e 'admin:x:' /etc/shadow",
#  require => User["admin"],
#  }
}
