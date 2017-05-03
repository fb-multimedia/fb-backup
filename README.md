# fb-backup
I use this script to backup drupal vm www files and mysql dump.
When using drupal vm, I use a samba share from guest to host to speed up perfs on windows. I need to rsync my /var/www files in guest to fb-backup/www folder on my windows Host.

## Install 
* In config.yml of drupal vm create a directory "fb-backup"(use share type "default")  that will containing my synced files.
* Place **www-backup.sh**, **mysql-backup.sh** and **dumper.php** in "fb-backup"
* Place **[fb-drupalvm] Backup Guest to Host.bat** on windows folder

## Use

### Dumping databases
* Create a **mysql** folder on /var/www and place **dumper.php** in it. add a host on config.yml to point this file :
```
  - servername: "mysql-backup.dev"
    serveralias: "mysql-backup.dev"
    documentroot: "/var/www/mysql/dumper.php"
    extra_parameters: "{{ apache_vhost_php_fpm_parameters }}"
```
access it thrue the drupalvm dashboard

* or run directly **mysql-backup.sh** from inside drupal vm :
```
$/var/fb-backup/./mysql-backup.sh
```
this will create a "www/mysql" directory on "fb-backup" and dump separates databases.sql.gz in it

### Backup(rsync) files
* run (as administrator) **[fb-drupalvm] Backup Guest to Host.bat** on windows. it need cygwin with rsync installed to work.
	Select a dir project present in var/www or leave empty for all,
	this will rsync www directory to fb-backup/www
	
* **backup-to-mybook.sh** is used to backup on my external drive
and is launch with **[fb-drupalvm] Backup to My Book.bat**


