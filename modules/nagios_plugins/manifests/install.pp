#Created by BW
class nagios_plugins::install {
 package { "nagios-plugins" :
 ensure => latest,
}
}
