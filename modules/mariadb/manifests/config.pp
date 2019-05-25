class mariadb::config {
file { "/etc/mysql/mariadb.conf.d/50-server.cnf":
ensure => present,
source => "puppet:///modules/mariadb/50-server.cnf",
mode => 0664,
owner => "root",
group => "root",
require => Class["mariadb::install"],
notify => Class["mariadb::service"],
}
cron { backup:
  command => "sudo mysqldump --all-databases --add-drop-table > /home/wendb2/db-backup.sql sudo mysqldump --all-databases --add-drop-table > /home/dorrejx1/db-backup.sql",
  user    => root,
  hour    => 22,
  minute  => 25
}
}
