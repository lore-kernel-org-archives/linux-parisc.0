Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA18641
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jan 2000 16:45:26 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id SAA01785
	for parisc-linux@thepuffingroup.com; Tue, 25 Jan 2000 18:46:41 -0500
Date: Tue, 25 Jan 2000 18:46:41 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000125184641.C32390@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Creating Ramdisks
List-ID: <linux-parisc.vger.kernel.org>


How to Create A Suitable Ramdisk.

several people have asked how to do it.  So here you go:

You will require One (1) Linux machine and the root password for it.

--- begin ---

#!/bin/sh

FILE=/tmp/ramdisk.bin
MOUNT=/mnt/ramdisk

# (0) Ensure the mount point exists.

if [ ! -d $MOUNT ]; then
  mkdir $MOUNT;
fi

# (1) Create a ramdisk of appropriate size.

dd if=/dev/zero of=$FILE bs=1024 count=400

# (2) Create a filesystem in it.

mke2fs $FILE

# (3) Mount it

mount -o loop $FILE $MOUNT

# (4) copy files into it.

echo Now copy your files into $MOUNT
bash

# (5) unmount

unmount $FILE

--- end ---

Ensure that you have /dev/console, /sbin/init, /dev/tty0 and a /proc
directory is probably also wise.  It's probably easiest to copy them
from a ramdisk already available, but here's an ls -lR of one:

# ls -lR /mnt/cdrom2
/mnt/cdrom2:
total 15
drwxrwxrwx   2 root     root         1024 Oct 18 13:23 dev
drwxrwxrwx   2 root     root        12288 Aug 22 15:12 lost+found
drwxrwxr-x   2 root     root         1024 Oct 19 12:21 proc
drwxrwxrwx   2 root     root         1024 Jan 24 17:26 sbin

/mnt/cdrom2/dev:
total 0
crwxrwxrwx   1 root     tty        5,   1 Oct 18 13:23 console
crwxrwxrwx   1 root     tty        4,   0 Oct 18 13:23 tty0
crwxrwxrwx   1 root     tty        4,   1 Oct 18 13:23 tty1
crwxrwxrwx   1 root     tty        4,   2 Oct 18 13:23 tty2
crwxrwxrwx   1 root     tty        4,   3 Oct 18 13:23 tty3
crwxrwxrwx   1 root     tty        4,   4 Oct 18 13:23 tty4
crwxrwxrwx   1 root     tty        4,   5 Oct 18 13:23 tty5
crwxrwxrwx   1 root     tty        4,   6 Oct 18 13:23 tty6
crwxrwxrwx   1 root     tty        4,   7 Oct 18 13:23 tty7
crwxrwxrwx   1 root     tty        4,   8 Oct 18 13:23 tty8
crwxrwxrwx   1 root     sys        7,   0 Oct 18 13:23 vcs0
crwxrwxrwx   1 root     sys        7,   1 Oct 18 13:23 vcs1
crwxrwxrwx   1 root     sys        7,   2 Oct 18 13:23 vcs2
crwxrwxrwx   1 root     sys        7,   3 Oct 18 13:23 vcs3
crwxrwxrwx   1 root     sys        7,   4 Oct 18 13:23 vcs4
crwxrwxrwx   1 root     sys        7,   5 Oct 18 13:23 vcs5
crwxrwxrwx   1 root     sys        7,   6 Oct 18 13:23 vcs6
crwxrwxrwx   1 root     sys        7,   7 Oct 18 13:23 vcs7
crwxrwxrwx   1 root     sys        7,   8 Oct 18 13:23 vcs8
crwxrwxrwx   1 root     sys        7, 128 Oct 18 13:23 vcsa
crwxrwxrwx   1 root     sys        7, 129 Oct 18 13:23 vcsa1
crwxrwxrwx   1 root     sys        7, 130 Oct 18 13:23 vcsa2
crwxrwxrwx   1 root     sys        7, 131 Oct 18 13:23 vcsa3
crwxrwxrwx   1 root     sys        7, 132 Oct 18 13:23 vcsa4
crwxrwxrwx   1 root     sys        7, 133 Oct 18 13:23 vcsa5
crwxrwxrwx   1 root     sys        7, 134 Oct 18 13:23 vcsa6
crwxrwxrwx   1 root     sys        7, 135 Oct 18 13:23 vcsa7
crwxrwxrwx   1 root     sys        7, 136 Oct 18 13:23 vcsa8

/mnt/cdrom2/lost+found:
total 0

/mnt/cdrom2/proc:
total 0

/mnt/cdrom2/sbin:
total 1036
-rwxr-xr-x   1 willy    guests     245760 Jan 18 02:46 ab
-rwxr-xr-x   1 willy    guests     237568 Jan 18 02:46 hellow
-rwxr-xr-x   2 root     root       283957 Jan 18 02:31 init
-rwxr-xr-x   2 root     root       283957 Jan 18 02:31 sash
