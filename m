From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Call for Testing
Date: Mon, 28 Mar 2005 10:24:13 -0500
Message-ID: <20050328152413.GB24913__669.919679831032$1416623727$gmane$org@roadwarrior.mcmartin.ca>
References: <20050327204550.GC7728@roadwarrior.mcmartin.ca> <424817E2.10705@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <424817E2.10705@tiscali.be>
Resent-Message-ID: <2z_VWB.A.t3E.hXCSCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Mon, Mar 28, 2005 at 02:42:42PM +0000, Joel Soete wrote:
> mdadm: cannot open device /dev/scsi/sdh0-f3f8c800c0i5l0p2: No such device 
> or adsmdadm: /dev/scsi/sdh0-f3f8c800c0i5l0p2 has wrong uuid.
> mdadm: cannot open device /dev/smd: md2 stopped.
> csi/sdh0-f3f8c800c0i6l0p2: No such device or address
> mdadm: /dev/scsi/sdh0-f3f8c800c0i6l0p2 has wrong uuid.
> mdadm: no devices found for /devfs/md/1
> mdadm: cannot open device /dev/scsi/sdh0-f3f8c800c0i5l0p5: No such device 
> or adsmdadm: /dev/scsi/sdh0-f3f8c800c0i5l0p5 has wrong uuid.
> mdadm: cannot open device /dev/scsi/sdh0-f3f8c800c0i6l0p5: No such device 
> or adsmdadm: /dev/scsi/sdh0-f3f8c800c0i6l0p5 has wrong uuid.
> mdadm: no devices found for /devfs/md/2
> EXT3-fs: unable to read superblock
> EXT2-fs: unable to read superblock
> isofs_fill_super: bread failed, dev=md2, iso_blknum=16, block=32
> pivot_root: No sKernel panic: Attempted to kill init!
> uch file or dire ctory
> /sbin/ini<0>Rebooting in 120 seconds..t: 431: cannot open dev/console: No 
> such e
>

That's very strange, I'll look into it. It might be caused by the zalon
module not being loaded. See below.
 
> TCP: Hash tables configured (established 131072 bind 65536)
> Root-NFS: No NFS server available, giving up.
> VFS: Unable to mount root fs via NFS, trying floppy.
> VFS: Cannot open root device "md2" or unknown-block(2,0)
> Please append a correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs on unknown-block(2,0)
> 
> well my custom config is CONFIG_SCSI_ZALON=y while your CONFIG_SCSI_ZALON=m 
> so should be loaded?
> 

Mmm. Yeah, you need the initrd, as that will contain the zalon module.

Could you add "zalon7xx" to /etc/mkinitrd/modules and regenerate the
initrd either by reinstalling the kernel image or with a command like

	# mkinitrd -o /boot/initrd.img-2.6.8-2-32 2.6.8-2-32

This may not be the exact line you need, I'm sorry I don't have time
to look what it precisely is.

Thanks for testing!

Cheers,
-- 
Kyle McMartin


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
