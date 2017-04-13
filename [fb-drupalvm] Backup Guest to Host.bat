@echo off

C:
chdir C:\cygwin\bin
set CYGWIN=binmode ntsec
bash --login -i /cygdrive/c/VMs/drupal-vm-4.4.0/fb-backup/www-backup.sh

pause