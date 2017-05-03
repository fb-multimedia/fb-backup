<?php
if(isset($_POST['exec']))
{
  if(isset($_GET['action']) && $_GET['action'] == 'yes')
  {
    $cmd = exec(escapeshellcmd('/var/fb-backup/./mysql-backup.sh'));
     
    if($cmd)
    {
       echo 'Dump terminé';
    }
    else
    {
       echo 'Le dump n\'a pas fonctionné';
    }
  }
}
 
echo '<form method="post" action="dumper.php?action=yes">
<input type="submit" name="exec" value="Backup mysql databases" >
</form>';