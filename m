Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA07558
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Jul 2000 14:53:49 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel1.hp.com (Postfix) with ESMTP id C2FB21B5A
	for <parisc-linux@thepuffingroup.com>; Fri,  7 Jul 2000 16:55:07 -0400 (EDT)
Received: from noam.fc.hp.com (noam.fc.hp.com [15.1.52.69])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 500AC4FD89
	for <parisc-linux@thepuffingroup.com>; Fri,  7 Jul 2000 16:55:07 -0400 (EDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13AfAW-0006tj-00
	for <parisc-linux@thepuffingroup.com>; Fri, 07 Jul 2000 14:56:16 -0600
To: parisc-linux@thepuffingroup.com
Date: Fri, 07 Jul 2000 14:56:16 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E13AfAW-0006tj-00@noam.fc.hp.com>
Subject: [parisc-linux] CD for LWE
List-ID: <linux-parisc.vger.kernel.org>


Hey Matt and I are planning a bootable/mountable CD-ROM (for at least
712 and A/B-180) to pass out at LinuxWorldExpo in August.  I've attached
a list of stuff which we want on it and want to know what other ideas
folks might have.

Issues:
    1) We're about to change system calls in a way which will require
       re-linking every current userspace program.  ARE THERE ANY OTHER
       KERNEL CHANGES which will require re-linking the whole world?

    2) Our "drop dead" date for the CD master is almost exactly a month away.
       Matt and I have vacations within this month but I think there
       is plenty of time to do something useful and fun.

    3) Our tool chain is in transition.  Matt and I won't have time to
	track late-breaking tool chain changes because there is still a
	bunch of hand work in cross-compiling userspacs apps (native
	compiling doesn't work often -- gcc segfaults).

    4) Lots of annoying things are broken -- how do we track and fix them?
	* gcc segfaults a lot under palinux.  For example the bison
	    configure script causes two gcc (cc1) segfaults.
	* /dev/tty doesn't work
	* when user-space processes fault, the kernel halts
	* you can't kill processes
	* login segfaults (unaligned memory access), which makes
	    telnetd and getty problematic
	* make sometimes segfaults (this might get fixed by rebuilding
	    with a newer glibc)
	* Intermittent panic in tulip_rx on B180 which probably requires
	    a busy LAN to reproduce

Ideas for the CD so far:

    Be directly bootable, with a working mounted root FS,
    on 712, and A/B-180 (others may work)
	Status: I have built and tested bootable/mountable CDs, but the
		required PALO changes are not all commited yet nor is
		the documentation complete.  We have somewhat interesting
		user space now.

    A binary copy of the x86-based cross compiler for Debian potato.
	Status: we're building this regularly.

    Copies of all the CVS trees from pehc which a developer would need,
    and possibly a script to fix up the CVS/Root files.

    Instructions for making a bootable hard disk from the CD (mkfs, fdisk,
    copy a bunch of stuff, run palo, reboot).
	Status: somebody need to write this

    If someone has too much time on their hands, a binary copy of the cross
    compiler hosted on HP-UX
	Status: unknown

    Copies of the PA-RISC documentation from pehc


	-Paul Bame
