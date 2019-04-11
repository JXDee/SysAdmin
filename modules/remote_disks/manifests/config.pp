class remote_disks::config {
 file { "/etc/":
  ensure => present,
  source => "",
  mode => 0664,
  owner => "root",
  group => "root",
  require => Class["remote_disks::install"],
  notify => Class["remote_disks::service"],
 }
}






