Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA02946
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Jun 1999 09:19:39 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id LAA04569
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Jun 1999 11:28:48 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3773A030.C17480A9@thepuffingroup.com>
Date: Fri, 25 Jun 1999 11:28:48 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Booting the Linux-Kernel....
List-ID: <linux-parisc.vger.kernel.org>


I'm forwarding this message from Helge, and I'm making sure that the
mailing list is fixed.

- Alex

-------- Original Message --------
Subject: Booting the Linux-Kernel.... !
Date: Fri, 25 Jun 1999 16:28:53 +0200
From: Helge Deller <helge.deller@ruhr-uni-bochum.de>
Reply-To: helge.deller@ruhr-uni-bochum.de
To: parisc-linux <parisc-linux@thepuffingroup.com>

Hi !

Ok, I commited my changes to the bootloader, so that we now can begin to
start with the real kernel-work.

My changes in the bootloader are not very impressive, and you can
consider it as a big, bad hack,
but it does it´s job (and that is what counts !!). Later we can try to
optimize it...

You have to build your vmlinux on HP-UX (with make vmlinux) and then do
"make Image".
Then you will find the bootable image in /arch/parisc/hp/boot/Image.

The new bootloader reads SOM-Files and places them to their
Origin-Address, which was given in the arch/parisc/Makefile (currently
at 0x80000) and we do not need anymore to write the exec-orgin into the
boot-Image (because it will be done by the linker).

Currently the only problem I have is, that "make dep" doesn´t work with
my HP-UX-Machine, so I do "make dep" with my i386 and have the
Kernel-Tree (hosted on i386) connected via NFS from HP-UX. (Could maybe
someone take a look at this ?).
All compilations were done on HP-UX....

PS: You will see the kernel-banner, a spinng cursor and blinking LED´s,
really impressive :-)

Ok,
Thanks to you all !

Helge Deller.
