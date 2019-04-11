class nagios::install {
 package { "nagios3" :
           ensure => latest,
 	   require => User["nagios"],
}

user { "nagios":
       ensure => present,
       comment => "nagios user",
       gid => "nagios",
       shell => "/bin/false",
       require => Group["nagios"],
}

group { "nagios" :
        ensure => present,
}
}
