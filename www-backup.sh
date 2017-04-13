#@fb-multimedia backup script for drupal vm

#Backup www(guest) files to www-backup(host)
#Run this bash from windows HOST true cygwin

#ask for a special directory
echo "[fb-drupalvm] Backup www(guest) files to www-backup(host)"
echo "Enter a directory in www to backup ( or leave blank for backup all):"
read dir
#define source path
sourcepath="//192.168.88.88/www"
#define target
target="/cygdrive/c/VMs/drupal-vm-4.4.0/fb-backup/www"
#create www on target directory
if [ ! -d $target ] ; then
mkdir $target
fi
#rsync
rsync -a --delete-after --info=progress2 --progress $sourcepath/$dir $target
