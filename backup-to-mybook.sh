#@fb-multimedia backup script for drupal vm

#Backup [fb-drupalvm]www-backup here
echo "[fb-drupalvm] Backup www-backup to My Book drive"
echo "Enter the directory in www to backup (leave blank for all):"
read dwheel
#define source path
sourcepath="/cygdrive/c/VMs/drupal-vm-4.4.0/fb-backup/www"

#define target
target="/cygdrive/e/_A WORK IN PROGRESS/DrupalVM Backup/fb-backup/www/"

#rsync
rsync -a --delete-after --progress --info=progress2 $sourcepath/$dwheel "$target"

