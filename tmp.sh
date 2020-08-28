ssh ubuntu@$ip '
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMptrDTq6LO1CVEcdRz283UxigSp3sFXILB9KBcI2jiG9ILM7ZaC5xVhk1TKsimJCBxqci7iLcur5cMiiyyUVYfW6qzoydkkjABtW+n4GizGOERFCamiFKfOxSq9ZyQngXqKoexDiCKsmX8Jgo25ET32cXhu20f3iEHXcFsuY9CC4QqXCuSj579BPZqqqeQPJEZwjXTutkjg275IW49xz+GlMAu46nu3PuT3lAhUd5NohxmYSnOQ2PD3dQco36qJrKW9w0Izvbo4PhAPvOMH7lHhxS+bXMag4ha2yI2MfvM1pcbhSp4rUlvj5zTdXj/u9xbKdRGagObBbK/SLwoT/p jenkins@JenkinsServer
" >> /home/ubuntu/.ssh/authorized_keys 
sudo apt-get update
sudo apt-get install nagios-nrpe-server nagios-plugins -y
sudo chmod 777 -R /etc/nagios/
sudo echo " allowed_hosts=127.0.0.1,172.31.63.150" >> /etc/nagios/nrpe.cfg
sudo echo " $ip Nagios2" >> /etc/hosts
sudo service nagios-nrpe-server restart '


ssh ubuntu@172.31.63.150 '
sudo chmod 777 -R /usr/local/nagios/
sudo echo " 
define host {
        use                          linux-server
        host_name                    Nagios2
        alias                        Ubuntu Host
        address                      $ip
        register                     1

}
define service {
      host_name                       Nagios2
      service_description             PING
      check_command                   check_ping!100.0,20%!500.0,60%
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}
define service {
      host_name                       Nagios2
      service_description             Check Users
      check_command           check_local_users!20!50
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}
define service {
      host_name                       Nagios2
      service_description             Local Disk
      check_command                   check_local_disk!20%!10%!/
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}
define service {
      host_name                       Nagios2
      service_description             Check SSH
      check_command                   check_ssh
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}
define service {
      host_name                       Nagios2
      service_description             Total Process
      check_command                   check_local_procs!250!400!RSZDT
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                       1
}
" >> /usr/local/nagios/etc/servers/host5.cfg
sudo systemctl restart nagios
'

