class ssh::install {
package { "ssh" :
ensure => present,
#require => User["ssh"],
}
#user { "sshd":
#ensure => present,
#gid => "ssh",
#shell => "/sbin/nologin"
#require => Group["ssh"],
#}
group { "ssh" :
ensure => present,
}
}
