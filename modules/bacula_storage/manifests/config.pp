 class bacula_storage::config {
  file { "/etc/bacula/bacula-sd.conf":
   ensure => present,
#   source => "puppet:///modules/bacula_storage/bacula-sd.conf",
   mode => 0664,
   owner => "root",
  group => "bacula",
  require => Class["bacula_storage::install"],
 notify => Class["bacula_storage::service"],
 content => template("bacula_storage/bacula-sd.conf.erb"),
 }
}
