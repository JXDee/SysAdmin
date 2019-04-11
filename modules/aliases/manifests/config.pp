#Created by BW
class aliases::config {
  file {"/home/wendb2/.bash_aliases":
  ensure => present,
  owner => 'wendb2',
  group => 'wendb2',
source => "puppet:///modules/aliases/bash_aliases",
mode => 664,
}
}
