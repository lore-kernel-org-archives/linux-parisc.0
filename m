From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: FW: [parisc-linux] Fwd: RE: Hp c3600 Gentoo Installation troubles
Date: Thu, 6 Jan 2005 14:23:47 -0500
Message-ID: <200501061423.47593.vapier@gentoo.org>
References: <NAEELOAPEHKLDEDOLEIHMEOMCCAA.bfisher@intech-intl.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: gentoo-hppa@lists.gentoo.org,
 parisc-linux@parisc-linux.org
To: "Ben Fisher" <bfisher@intech-intl.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <NAEELOAPEHKLDEDOLEIHMEOMCCAA.bfisher@intech-intl.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 06 January 2005 01:48 pm, Ben Fisher wrote:
> What do you do about /etc/fstab for the f0 partition?  Can that make palo
> stop working?

nothing ... just pretend the partition doesnt exist :)

> I read some stuff last night online about HPUX users having similar
> troubles if they did not run "lifinit" to initialize the LIF image.  Is
> there a command in Gentoo which does this?  Is palo supposed to take care
> of it?

i believe so ... of course more experienced people could talk about this; ive 
never used HPUX

> Is there anything else I could have done wrong to create this problem?
> Since you have a working c3600 with Gentoo, could you send me a copy of
> your /etc/palo.conf, /etc/fstab, and any other configuration files you
> think important?

here's my fdisk:
Disk /dev/sda: 50.0 GB, 50019202560 bytes
255 heads, 63 sectors/track, 6081 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1               1           3       24066   f0  Linux/PA-RISC boot
/dev/sda2               4          10       56227+  83  Linux (/boot)
/dev/sda3              11         133      987997+  83  Linux (/)
/dev/sda4             134        6081    47777310   83  Linux (/usr)
[no swap, the machine has ~3gigs of ram :D]

fstab:
/dev/sda2               /boot   ext3    noauto,noatime  1 1
/dev/sda3               /               ext3    noatime                 0 1
/dev/sda4               /usr    ext3    noatime                 0 2

palo.conf:
--commandline=2/vmlinux root=/dev/sda3 term=ttyS0
--init-partitioned=/dev/sda
--recoverykernel=/boot/vmlinux.old

palo:
palo version 1.5 root@hake Fri Oct  1 13:58:29 EDT 2004
ELF32 executable
Partition Start(MB) End(MB) Id Type
1               1      23   f0 Palo
2              24      78   83 ext2
3              79    1043   83 ext2
4            1044   47700   83 ext2
F0 partition start sector 63 length 48132
do_ra(1, 5, 3, -1, '2/vmlinux root=/dev/sda3 term=ttyS0', 4, -1, 32256, 
24643584)
check_bootloader 213
checksum(0x2f270, 36864) = 0x00000000
ipl: addr 32768 size 36864 entry 0x0
 ko 0x0 ksz 0 k64o 0x0 k64sz 0 rdo 0 rdsz 0
<2/vmlinux root=/dev/sda3 term=ttyS0>
check_bootloader 650
checksum(0x26268, 36864) = 0x00000000
ipl: addr 32768 size 36864 entry 0x0
 ko 0x48000 ksz 4727926 k64o 0x0 k64sz 0 rdo 0 rdsz 0
<2/vmlinux root=/dev/sda3 term=ttyS0>

> Finally, what Graphics card are you using on your machine?  I think I've
> still got the FX-e card in my system, and I'm thinking about trading it for
> an ATI Radeon so I can run X, KDE, etc.

mine still has a Visualize FX4 ... the box is acting as a dev server for 
Gentoo, so i never bothered screwing with X on the box
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
