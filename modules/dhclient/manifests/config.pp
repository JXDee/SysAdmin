#Created by BW
class dhclient::config {
file {"/etc/dhcp/dhclient.conf":
ensure => present,
source => "puppet:///modules/dhclient/dhclient.conf",
mode => 0644,
owner => "root",
group => "root",
}

file {"/etc/dhcp/dhclient-enter-hooks.d/nodnsupdate":
ensure => present,
source => "puppet:///modules/dhclient/nodnsupdate",
mode => 0644,
owner => "root",
group => "root",
}

}
