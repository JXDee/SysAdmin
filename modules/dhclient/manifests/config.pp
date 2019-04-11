#Created by BW
class dhclient::config {
file {"/etc/dhcp/dhclient.conf":
ensure => present,
mode => 0644,
owner => "root",
group => "root",
}
}
