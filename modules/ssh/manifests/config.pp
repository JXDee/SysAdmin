#Created by BW
class ssh::config {
file { "/etc/ssh/sshd_config":
ensure => present,
source => "puppet:///modules/ssh/sshd_config",
mode => 0664,
owner => "root",
group => "root",
require => Class["ssh::install"],
notify => Class["ssh::service"],
}

ssh_authorized_key { 'wendb2-key':
  user => 'wendb2',
  type => 'ssh-rsa',
  key  => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAmXI7w2z+8zJHkZam3CK/gbFKdT22Xv9sxYRLAlKm46AsT3PP3hmNVdXj76N6q/9/rcJp7Zj91kUCKIHo5tbe2LFqUHwsjfC3+s0EN0j7S598i0qr6fS+aI49kLEkSf2tEFzkjdk221WksM7W9ylmPyptntVADGAkxZd62JazfN9z4c45GPvdgG4YAdrWxDYhFKZpKtVmBH6+o/axMsWrz3kT+nJGIgQs+c4RYT1+AJeQlgcOni+ZwjYvzimDDdQctq2N2n5AF1pMHwGkv96IXjTGmDlZ0xrzNCvOkWH7zjduXMufd7LpIN85aducmjJQjo3xe1nEnJVBsKkclaHI9Q==',
}
#user { 'wendb2':
#  ensure => present,
#  home => "/home/wendb2",
#  purge_ssh_keys => true,
#}

ssh_authorized_key { 'admin-key':
  user => 'admin',
  type => 'ssh-rsa',
  key => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAs/hEARtEO8yzxlscx+Ra1Hek9ILNkPAN6T8b6YxChNRsZZRg6qL8o4KJypnevHvvxQrJDdjR+IE+r/Gid+9+avQbf0JEM0CNhz8FslbJxrCJbFI02fpFnorcP/MFKgM9e02VWHX2mtw0mXeKTJrBq2+BsfqbxuNixVm3qAjK4/mo21mgtPaYr8yUEcGupUvypH6808UQAbaJeqo1tLFehW2FOWnBfnDFOVqGxlB9R4PJd7Jy3TzPpfjlfVO+blilry5sBnlZXoXrNx5UCxmUor4Lc5gKjhu8zYF3j7qshR28ZTPeTYdcuiFdqoSH3VJvkOCP0d3LLjbhwa4DxvaxFQ=='
}

ssh_authorized_key { 'johnny key':
  user => 'dorrejx1',
  type => 'ssh-rsa',
  key  => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAmRvQWswUcIQS3ySeAtv3X8QdB4MTYKxDNV2gqu+2t1RkD2rrHLj4oRO7CcPeC6Vd6mUt+Slf24UI36yNMH1wbtD7L/1+6mDODWbvGfVlp8JWPiL7aO9iCELGIMyr4X931CppTCFz+2xmRJLFx+0m8TobvlohUEpXWoNjfNGH5USg0P02s04bVBshhktAuUj+ru+xjhB55+7EjBe6flrI0rIKTe3/3SmTPREc4X5rFVihcxX3A/MYAvwu0e1CY4Yf4K9XddpdoLxosH4P9atEz7s3AHaRK5QsEr9LQpV0leWy3zIE1vSrNj+g3WY25PcHuzst8dvOUnOcoBnNRmLgFQ==',
}
#user { 'dorrejx1':
#  ensure => present,
#  home => "/home/dorrejx1",
#  purge_ssh_keys => true,
#}
}


