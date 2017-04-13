# fb-backup
I use this script to backup drupal vm www files and mysql dump.
When using drupal vm, I use a samba share from guest to host to speed up perfs on windows. I need to rsync my /var/www files in guest to fb-backup/www folder on my windows Host.

## Install 
* In config.yml of drupal vm create a directory "fb-backup"(use share type "default")  that will containing my synced files.
* Place **www-backup.sh** and **mysql-backup.sh** in "fb-backup"
* Place **[fb-drupalvm] Backup Guest to Host.bat** on windows folder

## Use
* run **mysql-backup.sh** from inside drupal vm. 
	this will create a "www/mysql" directory on "fb-backup" and dump separates databases.sql.gz in it
* run (as administrator) **[fb-drupalvm] Backup Guest to Host.bat** on windows. it need cygwin with rsync installed to work.
	Select a dir project present in var/www or leave empty for all,
	this will rsync www directory to fb-backup/www
	
* **backup-to-mybook.sh** is used to backup on my external drive
and is launch with **[fb-drupalvm] Backup to My Book.bat**


