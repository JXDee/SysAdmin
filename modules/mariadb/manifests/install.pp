class mariadb::install {
package { "mariadb-server" :
ensure => latest,
require => User["mysql"],
}
user { "mysql":
ensure => present,
comment => "MariaDB user",
gid => "mysql",
shell => "/bin/false",
require => Group["mysql"],
}
group { "mysql" :
ensure => present,
}
}
