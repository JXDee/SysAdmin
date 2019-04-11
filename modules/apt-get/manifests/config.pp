#Created be BW
class apt-get::config {

schedule { 'everyday':
  period => daily,
  range => '2-4',
}

exec { 'apt-update':                   
  command => '/usr/bin/apt-get update',
  schedule => 'everyday'
}
exec { 'apt-upgrade':
  path => '/usr/bin:/usr/sbin:/bin:/usr/local/sbin:/sbin',
  command => "apt-get upgrade -y",
  schedule => 'everyday'
}
}
