Received: from rhirst.linuxcare.com (user-140-159.jakinternet.co.uk [212.187.140.159])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id CAA32171
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Dec 2000 02:58:25 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 47F30B005; Thu,  7 Dec 2000 09:56:13 +0000 (GMT)
Date: Thu, 7 Dec 2000 09:56:13 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@puffin.external.hp.com, debian-hppa@lists.debian.org
Subject: Re: A500 status update
Message-ID: <20001207095613.D7166@linuxcare.com>
References: <200012070634.WAA07459@milano.cup.hp.com> <200012070649.WAA07510@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012070649.WAA07510@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Dec 06, 2000 at 10:49:49PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Dec 06, 2000 at 10:49:49PM -0800, Grant Grundler wrote:
> Grant Grundler wrote:
> > TODO:
> 
> I forgot to mention:
> o sleep seg faults (syscall issue?)
> o syslogd seg faults (ditto?)
> o CONFIG_GENRTC=n since hwclock crashes the system at that point
> o have bogus /sbin/modprobe (shell script that echo's the parms)
> 
> Anything else I'm forgetting?

I see "KERNEL BUG at page_alloc.c:111" at random - not very often
though.

I get random chassis code dumps associated with lockups that last
a few seconds.  System generally carries on after ack-ing the error.
Don't know if these chassis codes are always the same, no examples to
hand.

Occasionally a boot will fail looping on "break 0,0: pid=1 command='init'"
and a register dump.

If I use the file system from nfsroot-20001009.tar.gz then I can get
through a boot, login, and a shell prompt.  If I use the file system
from the beta 0.5 CD base.tgz, then it goes to sleep after login
but before shell prompt.

I don't get sleep or syslogd seg faulting, on either file system.

Trying to mount a local file system is ok, but trying to mount an
nfs file system causes mount to segv.

I was able to configure two ethernet interfaces on seperate subnets
and ping them both from remote machines.

I had to disable scatter/gather in the scsi driver to make the disk
work.

I am able to boot from scsi disk, but it is rather fragile.  Worked
for a while, then reboot gave:

> INIT: version 2.78 booting
> Activating swap...
> Checking root file system...
> Parallelizing fsck version 1.19 (13-Jul-2000)
> /dev/sda5 was not cleanly unmounted, check forced.
> /dev/sda5:                                                                      
> Special (device/socket/fifo) inode 17422 has non-zero size.  FIXED.
> /dev/sda5: Special (device/socket/fifo) inode 17424 has non-zero size.  FIXED.
> /dev/sda5:                                                                      
> Entry 'bin' in / (2) has deleted/unused inode 4081.  CLEARED.
> /dev/sda5: Entry 'boot' in / (2) has deleted/unused inode 8161.  CLEARED.
> /dev/sda5: Entry 'cdrom' in / (2) has deleted/unused inode 12241.  CLEARED.
> /dev/sda5: Entry 'dev' in / (2) has deleted/unused inode 16321.  CLEARED.
> /dev/sda5: Entry 'etc' in / (2) has deleted/unused inode 20401.  CLEARED.
> /dev/sda5: Entry 'floppy' in / (2) has deleted/unused inode 89761.  CLEARED.
> /dev/sda5: Entry 'home' in / (2) has deleted/unused inode 91801.  CLEARED.
> /dev/sda5: Entry 'initrd' in / (2) has deleted/unused inode 93841.  CLEARED.
> /dev/sda5: Entry 'lib' in / (2) has deleted/unused inode 95881.  CLEARED.
> /dev/sda5: Entry 'mnt' in / (2) has deleted/unused inode 102001.  CLEARED.
> /dev/sda5: Entry 'proc' in / (2) has deleted/unused inode 104041.  CLEARED.
> /dev/sda5: E
> do_page_fault() pid=17 command='fsck.ext2'
> ntry 'root' in /
>  (2) has deleted     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> 0SW: /unused inode 1006081.  CLEARED.
>  /dev/sda5: Entr0y 'sbin' in / (20) has deleted/un0used inode 1081201.  CLEARED.
> /d0ev/sda5: Entry '0tmp' in / (2) ha0s deleted/unused0 inode 110161.  0CLEARED.
> /dev/s0da5: Entry 'usr'0 in / (2) has de1leted/unused ino1de 112201.  CLEA0RED.
> /dev/sda5:1 Bad inode numbe1r for '.' in dir1ectory inode 20410.
> 
> 
> 1dev/sda15: UNEXPECTED IN1CONSISTENCY; RUN1 fsck MANUALLY.
>         (i.e., without0 -a or -p option0s)
> 001011
> r0-3     0000000000000000 00000000000007f8 0000000040031c13 0000000020020600
> r4-7     000000004003515c 0000000000000004 0000000000000000 000000004001b210
> r8-11    0000000000000006 0000000000000001 0000000020020648 0000000000017298
> r12-15   0000000000000000 0000000000017298 0000000000048100 0000000000002105
> r16-19   0000000000020000 0000000000020002 0000000000078440 000000004003515c
> r20-23   000000004001e000 0000000078000000 0000000040031bf8 000000004015be64
> r24-27   000000000000002d 000000004015b138 0000000000000004 00000000000165cc
> r28-31   0000000000000000 00000000000173f8 0000000020020720 000000004000f6df
> sr0-4    0000000000000380 0000000000000000 0000000000000000 0000000000000380
> sr4-8    0000000000000380 0000000000000380 0000000000000380 0000000000000380
> 
> IASQ: 0000000000000380 0000000000000380 IAOQ: 00000000400231af 00000000400231b3
>  IIR: 0c201094    ISR: 0000000000000380  IOR: 00000000000007f8
> ORIG_R28: 0000000000000000
> Warning... fsck.ext2 for device /dev/sda5 exited with signal 11.
> 
> fsck failed.  Please repair manually and reboot.  Please note
> that the root file system is currently mounted read-only.  To
> remount it read-write:
> 
>    # mount -n -o remount,rw /
> 
> CONTROL-D will exit from this shell and REBOOT the system.
> 
> Give root password for maintenance
> (or type Control-D for normal startup): 
> bash-2.04# 
> bash-2.04# 
> bash-2.04# ls
> lost+found  var

At this point I gave up and went to bed!

Richard
