#Created by BW
class vim::config {
  file {"/home/wendb2/.vimrc":
  ensure => present,
  owner => 'wendb2',
  group => 'wendb2',
  source => "puppet:///modules/vim/vimrc",
  mode => 664,
  require=>Class["vim::install"],
  }
}

