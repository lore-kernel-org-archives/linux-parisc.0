From: "cbeerse@gmail.com" <cbeerse@gmail.com>
Subject: Re: [parisc-linux] Upgrading from 2.4 to 2.6
Date: Wed, 02 Mar 2005 11:28:04 +0100
Message-ID: <42259534.6080500__32712.5654941939$1416623681$gmane$org@gmail.com>
References: <FHEGKPBPFFGIFBGOANOKMENIEPAA.h.cochran@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Harry Cochran <h.cochran@comcast.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <FHEGKPBPFFGIFBGOANOKMENIEPAA.h.cochran@comcast.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Harry Cochran wrote:

> Thanks for your input. Could it really be true that the "stable" version of
> 2.6 (2.6.8-2-32-smp) can't recognize an ext3 root partition? The only way I
> know to "load a new kernel" since I can only boot fromt he install cd is to
> blow away what I have spent a lot of time building. Seems like I'm missing
> something.

Yes, that is true. IF the ext3 filesystem is not built into the kernel (but 
compiled as a module) then the system cannot use that as the root filesystem. 
Its a kind of chicken and egg problem: the kernel needs to know the filesystem 
to access the modules.

You donnot need to put away a lot: If ext2 is buld-in and ext3 is not, just 
update (downdate...) /etc/fstab to indicate that root is in ext2. I expect ext3 
is readable as ext2 too. If needed you might need to downgrade the root to ext2 
(with `tune2fs`, remove the journalling stuff).

An other idea is to use an other machine to put a kernel on the boot-partition 
that can read ext3.

Then, you can also try to load the ext3 module (or any other module) from an 
other medium like tape, cdrom or network, if the kernel can use that.


Success

CBee



> 
> -----Original Message-----
> From: cbeerse@gmail.com [mailto:cbeerse@gmail.com]
> Sent: Thursday, February 24, 2005 4:46 AM
> To: Harry Cochran
> Subject: Re: [parisc-linux] Upgrading from 2.4 to 2.6
> 
> 
> Harry Cochran wrote:
> 
> 
>>Hi,
>>
>>	Could someone please help me recover from a failed attempt to upgrade my
>>J6000 to 2.6?
>>
>>	Looks like I can't boot the 2.4 kernel I have on the system because it's
>>name doesn't end in 32 or 64 (it ends in smp) -><-.
>>
>>	My J6000 has a cd-rom, so I thought maybe I could boot from that, but sea
>>ipl doesn't find it.
>>
>>Here's my original question:
>>
>>*************
>>
>>	Sorry for the newbie question, but I'm trying to boot 2.6 and I don't
> 
> quite
> 
>>understand how to set up the "root=" for it.
> 
> 
> With palo, the partition/mount info is also important: some directories are
> relative to the boot-partition, others are relative to the root partition.
> 
> 
>>My palo.conf says:
>>--command line=1/boot/vmlinux root=/dev/sda3 HOME=/ initrd=/initrd.img
>>console=ttyS0 TERM=vt102
>>--recoverykernel=/boot/vmlinux
> 
> 
> This recovery-kernel is relative to the run-time root.
> Be noted, this kernel is moved to the palo-partition (/dev/sda0) when
> running
> `palo`. Best to use the distro's kernel for this, alternative, a kernel that
> sure works for recovery purposes. Most systems have /boot/vmlinux a softlink
> to
> the prefered kernel, which most times is not the recovery kernel...
> 
> 
>>--init-partitioned=/dev/sda
>>
>>Here's what my palo.conf generates on boot right now:
>>
>>0 1/boot/vmlinux
> 
> 
> The 1 indicates partition 1 is the boot-partition, the /boot/vmlunix is a
> relative path on that partition. Hence, If /dev/sda1 is your /boot
> partition, te
> line should be: "1/vmlinux".
> 
> Then, the filesystem of /boot is best `ext2` since that is supported by
> most, if
> not all tools. Other filesystems might not be supported.
> 
> 
>>1 root=/dev/sda3
> 
> 
> The root filesystem
> 
> 
>>2 HOME=/
>>3 initrd=/initrd.img
> 
> 
> Carefully check if the initrd parameter is relative to the root or to the
> boot
> filesystem.
> 
> 
>>4 console=ttys0
>>5 TERM=vt102
>>
>>On boot I get:
>>
>>cannot open root device "sda3" or unknownblock(2.0)
> 
> 
> What is the filesystem on /dev/sda3? It better be ext2 since that is
> understood
> by most systems. ext3 is possible, I would not use others.
> 
> 
>>Please append a correct "root=" boot option
>>Kernel panic: VFS: Unable to mount root fs or unknown-block(2.0)
> 
> 
> I think your kernel only allows ext2 and finds something else.
> 
> 
>>	I have seen one document which says I have to build a ramdisk, but it
>>doesn't tell me how. What's worse is that I can't get 2.4.26 to boot again
>>even though I have a symlink (vmlinux.old) to it. I tried changing line 0
> 
> to
> 
>>1/boot/vmlinux.old (and deleting the "initrd=/initrd.img" line, but it
> 
> still
> 
>>boots 2.6.8. I even tried inserting a line saying
>>recoverykernel=/boot/vmlinux.old but that didn't help.
> 
> 
> I've seen teh palo that comes with gentoo has an option to list the
> directory of
> the boot-device, so you can check the kernel path.
> 
> Keep in mind:
> palo must be able to read the boot device (/dev/sd1). Try ext2.
> The kernel must be able to read the root device without loading a module.
> Most
> kernels have ext2 build in.
> 
> 
> My idea: once you have a proper working kernel, build a new one without any
> modules (all stuff build in) and configure that as a recovery kernel in
> palo.
> 
> 
>>*************
>>
>>	I'm sure there's an easy answer and maybe everyone is tired of answering
>>these kind of newbie questions, but I'm desperate, so I thought I'd try
> 
> one
> 
>>more time.
>>
>>Thanks,
>>
>>Harry
>>
>>
>>_______________________________________________
>>parisc-linux mailing list
>>parisc-linux@lists.parisc-linux.org
>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
> 
> 
> 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
