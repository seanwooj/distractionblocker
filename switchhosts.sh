#!/bin/bash
############################################
#### Variables
etc=~/../../etc # etc directory
hosts=$etc/hosts
alt="alt_hosts"

if [ -f $hosts ]
then
  echo $hosts
  echo "Moving hosts file into current directory"
  mv $hosts hosts
  echo "Moving alt_hosts file into etc directory"
  mv alt_hosts $hosts
  echo "Renaming old hosts file to alt_hosts"
  mv hosts $alt
  echo "Flushing DNS Cache"
  dscacheutil -flushcache
else
  echo "No hosts file found. SHIT."
fi

echo "done"
