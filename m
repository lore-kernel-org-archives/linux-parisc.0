Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jaguar.mkp.net (jaguar.mkp.net [66.11.169.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAB3B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 12:27:17 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 14 Jan 2003 14:27:11 -0500
Message-ID: <yq1smvv4jn4.fsf@austin.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PA-RISC Linux RAID1 Root HOWTO
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

PA-RISC Linux RAID1 Root HOWTO

I successfully got mirrored system drives going in my C3000 and
thought I'd share what I did to make this work.

Unfortunately, the Debian boot floppies do not support installations
onto software RAID so this is a multi-stage process:

    o Installing Debian on disk 1

    o Creating a degraded RAID1 array on disk 2 and copying the
      Debian installation over from disk 1

    o Repartitioning disk 1 and attaching it to the degraded array


                              --- o ---


1. First install a base Debian as usual onto the first disk.


2. Partition the second drive along the lines of this:  

    Disk /dev/sdb: 9173 MB, 9173114880 bytes
    255 heads, 63 sectors/track, 1115 cylinders
    Units = cylinders of 16065 * 512 = 8225280 bytes

       Device Boot    Start       End    Blocks   Id  System
    /dev/sdb1             1         5     40131   f0  Linux/PA-RISC boot
    /dev/sdb2             6        14     72292+  fd  Linux raid autodetect
    /dev/sdb3            15        77    506047+  fd  Linux raid autodetect
    /dev/sdb4            78      1115   8337735   fd  Linux raid autodetect

Caveat: If your two disks are not the same brand/model, you need to be
extra careful.  Capacities tend to vary a bit between models and you
must make sure that you can fit the same number of blocks on both
drives.  Use fdisk to compare the disk sizes and adjust the partition
sizes accordingly.

Note how the partition type is set to "Linux raid autodetect" (0xfd)
instead of the usual "Linux" (0x83).

The first partition is PALO, followed by /boot, swap and then a big
root.  As usual it's important that /boot is within the first 2GB.
You can have more partitions if you wish, but for this exercise I
decided to keep things to a minimum.


3. Now it is time to create the raid devices:

    # apt-get install mdadm
    # mdadm --create /dev/md0 --level 1 --raid-devices=2 missing /dev/sdb2
    # mdadm --create /dev/md1 --level 1 --raid-devices=2 missing /dev/sdb3
    # mdadm --create /dev/md2 --level 1 --raid-devices=2 missing /dev/sdb4

This creates 3 degraded RAID1 devices (/boot, swap, and /) consisting
of a placeholder ("missing") and the partitions created on /dev/sdb.

    # cat /proc/mdstat 
    Personalities : [linear] [raid0] [raid1] [raid5] 
    read_ahead 1024 sectors
    md2 : active raid1 sdb4[1]
          8337664 blocks [2/1] [_U]

    md1 : active raid1 sdb3[1]
          505920 blocks [2/1] [_U]
      
    md0 : active raid1 sdb2[1]
          72192 blocks [2/1] [_U]
      
    unused devices: <none>

Note how the first drive in all three cases is missing ("_") as
opposed to up ("U").


4. Create filesystems/swap space:

    # mke2fs -j /dev/md0
    [...]
    # mke2fs -j /dev/md2
    [...]
    # mkswap /dev/md1
    [...]


5. Mount the filesystems and copy data over:

    # mount /dev/md2 /mnt
    # mkdir /mnt/boot
    # mount /dev/md0 /mnt/boot 
    # cd /mnt
    # tar -C / -clspf - . | tar -xlspvf -


6. Edit the /mnt/etc/palo.conf so it looks like this:

    # cat /mnt/etc/palo.conf 
    --commandline=2/vmlinux root=/dev/md2 HOME=/
    --recoverykernel=/boot/vmlinux-2.4.17-32


7. Make /dev/sdb bootable by running palo:

    # palo -f /mnt/etc/palo.conf -I /dev/sdb
    palo version 1.1 mkp@allegro Tue Jan 14 12:44:00 EST 2003
    ELF32 executable
    Partition Start(MB) End(MB) Id Type
    1               1      39   f0 Palo
    2              40     109   fd RAID
    3             110     604   fd RAID
    4             605    8746   fd RAID
    ipl: addr 32768 size 30720 entry 0x0
     ko 0x0 ksz 0 k64o 0x0 k64sz 0 rdo 0 rdsz 0
    <2/vmlinux root=/dev/md2 HOME=/>
    ipl: addr 32768 size 30720 entry 0x0
     ko 0x48000 ksz 3687647 k64o 0x0 k64sz 0 rdo 0 rdsz 0
    <2/vmlinux root=/dev/md2 HOME=/>

I have committed a small change to palo to allow it to boot from RAID
partitions.  So you have to grab the CVS version of palo until Paul
makes a new release.


8. Update /mnt/etc/fstab so it says:

    /dev/md2   /       ext3    errors=remount-ro       0       1
    /dev/md1   none    swap    sw                      0       0
    /dev/md0   /boot   ext3    errors=remount-ro       0       2
    [...]


9. Shut down and boot off the RAID device on the second disk:

    Main Menu: Enter command > boot fwscsi.6.0

Substitute whatever the drive is called on your box.  It varies
depending on machine type.

After booting up, make sure things look like this:

    # swapon -s
    Filename                    Type            Size    Used    Priority
    /dev/md1                    partition       505912  0       -1
    # mount | grep md
    /dev/md2 on / type ext3 (rw,errors=remount-ro)
    /dev/md0 on /boot type ext3 (rw,errors=remount-ro)


10. At this point the box is running off the degraded RAID1 devices.
It is time to repartition the first disk so it matches the layout of
the second drive:

    Disk /dev/sda: 9173 MB, 9173114880 bytes
    255 heads, 63 sectors/track, 1115 cylinders
    Units = cylinders of 16065 * 512 = 8225280 bytes

       Device Boot    Start       End    Blocks   Id  System
    /dev/sda1             1         5     40131   f0  Linux/PA-RISC boot
    /dev/sda2             6        14     72292+  fd  Linux raid autodetect
    /dev/sda3            15        77    506047+  fd  Linux raid autodetect
    /dev/sda4            78      1115   8337735   fd  Linux raid autodetect


13. Once partitioning is taken care of, attach the new partitions to
the existing (degraded) RAID arrays:

    # mdadm /dev/md0 -a /dev/sda2
    mdadm: hot added /dev/sda2

    # mdadm /dev/md1 -a /dev/sda3
    mdadm: hot added /dev/sda3

    # mdadm /dev/md2 -a /dev/sda4
    mdadm: hot added /dev/sda4

    # cat /proc/mdstat 
    Personalities : [linear] [raid0] [raid1] [raid5] 
    read_ahead 1024 sectors
    md0 : active raid1 sda2[2] sdb2[1]
          72192 blocks [2/1] [_U]
          [====>................]  recovery = 23.9% (18112/72192) finish=0.1min speed=6037K/sec
    [...]


After a while all devices are in sync:

    # cat /proc/mdstat
    Personalities : [linear] [raid0] [raid1] [raid5] 
    read_ahead 1024 sectors
    md0 : active raid1 sda2[0] sdb2[1]
          72192 blocks [2/2] [UU]
      
    md1 : active raid1 sda3[0] sdb3[1]
          505920 blocks [2/2] [UU]
      
    md2 : active raid1 sda4[2] sdb4[1]
          8337664 blocks [2/2] [UU]

    unused devices: <none>


14. Make sda bootable with palo:

    # palo -I /dev/sda


15. Tell the system firmware which devices to boot from (again, your
drive names may vary) and turn on auto {boot,search,start}:

    Main Menu: Enter command > pa pri fwscsi.5.0
      Primary boot path:    FWSCSI.5.0

    Main Menu: Enter command > pa alt fwscsi.6.0
      Alternate boot path:  FWSCSI.6.0

    Main Menu: Enter command > co

    Configuration Menu: Enter command > au bo on
      Auto boot:            ON

    Configuration Menu: Enter command > au sea on
      Auto search:          ON

    Configuration Menu: Enter command > au st on
      Auto start:           ON

    Configuration Menu: Enter command > reset


And that's it.  Should the primary drive fail, the system will attempt
to boot from the alternate path (Assuming the SCSI bus isn't hosed,
that is.  On servers like A500 the two drive bays are on different
controllers for this reason.  But C3000 is a workstation and doesn't
have that feature).

-- 
Martin K. Petersen      http://mkp.net/
