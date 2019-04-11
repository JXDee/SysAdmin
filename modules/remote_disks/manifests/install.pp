class remote_disks::install {
 package { "remote-disks" :
  ensure => latest,
  require => User["remote-disks"],
 }

 user { "remote-disks":
  ensure => present,
  comment => "remote-disks user",
  gid => "remote-disks",
  shell => "/bin/false",
  require => Group["remote-disks"],
 }

 group { "remote disks" :
  ensure => present,
 }
}
