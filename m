From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Booting 2.6
Date: Wed, 23 Feb 2005 14:40:33 -0700
Message-ID: <20050223214033.GC26124@colo.lackof.org>
References: <20050222210531.6c4fccc2@Tatooine.r3z0>
	<FHEGKPBPFFGIFBGOANOKGEMLEPAA.h.cochran@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Harry Cochran <h.cochran@comcast.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <FHEGKPBPFFGIFBGOANOKGEMLEPAA.h.cochran@comcast.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Feb 23, 2005 at 10:56:34AM -0500, Harry Cochran wrote:
> Hi,
> 
> 	Sorry for the newbie question, but I'm trying to boot 2.6 and I don't quite
> understand how to set up the "root=" for it.

The name of the root disk might have changed IFF you have more
than one disk installed/connected to the system.
Look through console output 
> 
> My palo.conf says:
> --command line=1/boot/vmlinux root=/dev/sda3 HOME=/ initrd=/initrd.img

I expect this needs to say:
	initrd=1/boot/initrd.img

I personally like to point palo/elilo/lilo directly
at the file to load by default (and not a symlink).

> console=tys0 TERM=vt102
> --recoverykernel=/boot/vmlinux
> --init-partitioned=/dev/sda
> 
> Here's what my palo.conf generates on boot right now:
> 
> 0 1/boot/vmlinux
> 1 root=/dev/sda3
> 2 HOME=/
> 3 initrd=/initrd.img
> 4 console=ttys0
> 5 TERM=vt102
> 
> On boot I get:
> 
> cannot open root device "sda3" or unknownblock(2.0)

Well, if the kernel expects devfs mounted or something else,
then you have to sort out which /dev files are needed.

I suspect more likely either the sym53c8xx driver didn't get
loaded (no initrd found possibly) or more than one disk
is installed and the device name changed.

> Please append a correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs or unknown-block(2.0)
> 
> 	I have seen one document which says I have to build a ramdisk, but it
> doesn't tell me how.

mkinitrd is the command you are looking for. But I don't use an
initrd on my boxes since I'm building my own kernels. The initrd
is most useful for generic kernel builds where one wants every
possible driver available as a potential root device.  Since I
build my own kernels and know which drivers are needed for root,
I don't really need an initrd.

?  What's worse is that I can't get 2.4.26 to boot again
> even though I have a symlink (vmlinux.old) to it. I tried changing line 0 to
> 1/boot/vmlinux.old, but it still boots 2.6.8. I even tried inserting a line
> saying recoverykernel=/boot/vmlinux.old but that didn't help.
> 
> 	Sounds easy ... just go to 2.6 (the solution to a problem I'm trying to
> implement), but for this newbie, it's anything but.

*nod*

Here's my palo.conf:
ioz:~# cat /etc/palo.conf  
--commandline=0/vmlinux-2.6.11-rc2-pa3-UP root=/dev/sda3 panic=5 console=ttyS1
--format-as=2
--update-partitioned=/dev/sda

[ I've also added "noudev" to the commandline on some of the machines. ]

ioz:~# fdisk -l /dev/sda
ioctl32(fdisk:4277): Unknown cmd fd(4) cmd(40081272){00} arg(faf005f0) on /dev/sda

Disk /dev/sda: 73.4 GB, 73407865856 bytes
255 heads, 63 sectors/track, 8924 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          24      192748+  f0  Linux/PA-RISC boot
/dev/sda2              25         148      996030   82  Linux swap
/dev/sda3             149        2140    16000740   83  Linux
/dev/sda4            2141        8924    54492480   83  Linux

ioz:~# mount
/dev/sda3 on / type ext3 (rw,errors=remount-ro)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw)
/dev/sda1 on /boot type ext2 (rw)
/dev/sda4 on /home type ext3 (rw)


I hope the above should get you on the right track.



> 
> 	Please help.
> 
> Thanks,
> 
> Harry
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
