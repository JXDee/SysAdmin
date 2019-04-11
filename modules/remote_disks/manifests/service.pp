class remote_disks::service {
 service { "remote-disks" :
  ensure => running,
  hasstatus => true,
  hasrestart => true,
  enable => true,
  require => Class["remote_disks::config"],
 }
}
