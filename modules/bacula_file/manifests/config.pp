 class bacula_file::config {
  file { "/etc/bacula/bacula-fd.conf":
   ensure => present,
 #  source => "puppet:///modules/bacula_file/bacula-fd.conf",
   mode => 0664,
   owner => "root",
   group => "bacula",
   require => Class["bacula_file::install"],
   notify => Class["bacula_file::service"],
   content => template("bacula_file/bacula-fd.conf.erb"),
  }
 }
