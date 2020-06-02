#!/bin/bash
ora=$(date +%Y.%m.%d-%H.%M)
bkp="/var/backups"
rpm -qa --qf "%{NAME}\n" | sort > $bkp/installed-packages-$ora.txt
inxi -SDpxxxz > $bkp/sysinfo-$ora.txt
tar zcf $bkp/etc-asterisk-$ora.tar.gz /etc/asterisk
tar zcf $bkp/var-log-asterisk-$ora.tar.gz /var/log/asterisk
tar zcf $bkp/var-lib-asterisk-$ora.tar.gz /var/lib/asterisk
tar zcf $bkp/var-spool-asterisk-$ora.tar.gz /var/spool/asterisk
tar zcf $bkp/usr-lib-asterisk-$ora.tar.gz /usr/lib/asterisk
tar zcf $bkp/asterisk-backup-$ora.tgz $bkp/*$ora*
rm -f $bkp/*.tar.gz
rm -f $bkp/*.txt
rclone sync $bkp azure:pbx
