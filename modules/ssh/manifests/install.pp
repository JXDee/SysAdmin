class ssh::install {
package { "ssh" :
ensure => latest,
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
