Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA15325
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 18:54:49 -0600
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id SAA16253
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 18:55:39 -0600 (MDT)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id SAA25732 for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 18:55:39 -0600 (MDT)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id SAA20611
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 18:55:38 -0600
Message-Id: <199910220055.SAA20611@debian.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Thu, 21 Oct 1999 18:55:38 -0500
From: Paul Bame <bame@debian.fc.hp.com>
Subject: [parisc-linux] boot loader
List-ID: <linux-parisc.vger.kernel.org>


Here's a sketch of a new (really, mostly stolen from other places
like the existing boot_code code) boot loader for parisc.  It's
aimed at solving some of our current problems (like linking ramdisks
into the kernel) and being good enough to live on for a while,
and be easily replaced if it starts to smell bad.

In order to use HP boot firmware, our disk layout has to look
at least somewhat like a LIF volume (as it does today), so it
makes sense to use LIF for a few other things too.  LIF is a
very simple file system layout -- almost as simple as the one
we were going to use for ramdisks.

My proposal is to have a LIF volume on the beginning of any disk
from which one might boot.  Make that LIF volume at least 2Mb, and
maybe 10Mb if you want to store several kernels and ramdisk images.
Here are the files it would hold:

	IPL		Pretty much the boot loader we're using today
			with some LIF intelligence added
	vmlinuz		The kernel image, put there with the 'lifcp'
			command.  Could have several kernels
			on the LIF volume and boot any of them.
	cmdline		The default, or the last?, command line used
			to boot Linux.  Could possibly have several
			different command lines in one or several files
			but the UI for this needs thought.
	ramdisk		One or more files containing ramdisk images
	ptable		Partition table -- see below

During boot, the IPL is same as today.  It presents a
command line just like today, from the 'cmdline' file if one is
available.  On the command line you can select which kernel to
boot if you have more than one and enter the normal Linux
command-line parameters.  There'll be some little extension to handle
specifying which ramdisk image you want, which is stripped off
by the IPL and not passed to the kernel in that form.  The HP
firmware would continue to be used, as it is today, to select whether
you want to interact with the boot loader command line or not.

When the command line is committed, the ramdisk and kernel are loaded
just like they are today (using the same code probably) the kernel
is told how to find the ramdisk image (need to learn how this is done).

Non-bootable disks can skip the LIF volume header altogether, though
they might want it just in case they want to be bootable in the future.

			Partition Table

I suggest we place the partition table at a fixed low address on
the disk such that it can appear as a file in the LIF file system
on disks which have them, and be in the same location on non-LIF
disks just there wouldn't be any LIF sugar around it.  This way
the table's always in the same place which is easy for the tools
which use it, and it's a LIF file too which might be convenient.
Alex suggests we re-use maybe the sparc partition table format?

			Development Cycle

After building a new kernel, you'd have to
'lifcp <the-kernel-image> /dev/sda:vmlinuz' instead of
doing 'mkImage' like we do today.  It's also cool that the ramdisk
isn't linked into the kernel.

		    If you already have HP-UX

The existing HP-UX LIF volume header has less than 300k of free
space, so it wouldn't be large enough to hold vmlinuz, therefore
you can't boot from an existing HP-UX volume.  Which means if
you want to keep your HP-UX disk intact, you'll have to add another
disk for Linux, and I think the firmware can handle booting from
one of several disks just fine.

			    Tools

lifinit and lifcp should already be able to handle the LIF stuff, so
no new C code required to build the LIF volumes.  We can probably
talk HP into open sourcing the LIF commands, and if not can grab
the ones from OpenBSD.  For now we can use the ones on HP-UX.
[I suspect the HP ones are not byte-order safe (yet).]

			    Future

It's relatively easy to replace IPL (and vmlinuz for that matter)
in the scheme above with wonderful new stuff when we figure out
what that is.  The firmware and existing disk headers wouldn't
have to change to accomodate a new boot loader.

			    The Name

BTW the current contender for the name, instead of hilo, is palo
for PArisc LOader.  It is also a reminder of of Palo Alto
which is where HP began.

Comments?

			    -Paul Bame
