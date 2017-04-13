#@fb-multimedia backup script for drupal vm

#Backup mysql databases
#Run this script INSIDE the VM !
echo "Backup mysql databases"

#target directory
target=/var/fb-backup/www/mysql

#create mysql folder on target directory if doesn't exist
if [ ! -d $target ] ; then
mkdir $target
fi

#dump to target
mysql --skip-column-names -u root -proot -e 'show databases where `Database` not in("information_schema","performance_schema","phpmyadmin", "sys", "mysql")' | while read dbname; do mysqldump --lock-all-tables -u root -proot "$dbname"| gzip> $target/"$dbname".sql.gz; done


