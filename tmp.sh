ssh -i ubuntu@172.31.51.50 '
ip=`aws ec2 describe-instances --region us-east-1 --query "Reservations[*].Instances[*].PublicIpAddress" --output=text | tail -1`

sudo su -
sudo hostname Nagiosslave4
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMptrDTq6LO1CVEcdRz283UxigSp3sFXILB9KBcI2jiG9ILM7ZaC5xVhk1TKsimJCBxqci7iLcur5cMiiyyUVYfW6qzoydkkjABtW+n4GizGOERFCamiFKfOxSq9ZyQngXqKoexDiCKsmX8Jgo25ET32cXhu20f3iEHXcFsuY9CC4QqXCuSj579BPZqqqeQPJEZwjXTutkjg275IW49xz+GlMAu46nu3PuT3lAhUd5NohxmYSnOQ2PD3dQco36qJrKW9w0Izvbo4PhAPvOMH7lHhxS+bXMag4ha2yI2MfvM1pcbhSp4rUlvj5zTdXj/u9xbKdRGagObBbK/SLwoT/p jenkins@JenkinsServer
" >> /home/ubuntu/.ssh/authorized_keys
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCirDOHKvfoIDlEiM8fZhrEO/feep05vs198gJUI3Va7ggEXO8zyQaFnAbDcfBL0aAOH5nrpEfSQE1nikjHVE+ytUtRjElqwtGtuTRdP65zkRZQ9GAvNhqZW8mBB5QXhLbY96PVf4K62mc2tQqm1B6duCvpqDnmui8ImDHAeVM/Tfg2pmwkTn90BdFSsXXhUhXTRCIbBt/sn0MdpKrMyh62vsMB1F7mQzi+mKvfzyYEWuDXTFwVZ6z1QNs9jPyX01joj9eWX+KCFO6m//lzzOCsgTe0eR7Bd8tjoEo9PiF50aGG2WV6mBeUH/20qpNA8OwP6rsb/+Gne66EoUlaI8cT ubuntu@NagiosMaster
" >> /home/ubuntu/.ssh/authorized_keys
'
