class ntp_service {
 include install, config, service
}

class ntp_service::install {
package { "ntp":
ensure => present,
 }
}

class ntp_service::config {
if $hostname == "group06mgmt.foo.org.nz" {
$restrict = "restrict 10.25.0.0 mask 255.255.0.0 nomodify notrap"
$server = "server 127.127.1.0"
$fudge = "127.127.1.0 stratum 10"
} else {
$restrict = ""
$server = "server group06mgmt.foo.org.nz prefer"
$fudge = ""
}

file { "/etc/ntp.conf":
ensure => present,
owner => "root",
group => "root",
mode => 0664,
content => template("ntp_service/ntp.conf.erb"),
}
}

class ntp_service::service {
service { "ntp":
ensure => running,
enable => true,
}
}
