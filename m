Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA07907
	for <parisc-linux@puffin.external.hp.com>; Fri, 28 Jul 2000 09:34:56 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 28B01815
	for <parisc-linux@thepuffingroup.com>; Fri, 28 Jul 2000 08:36:52 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id IAA26861
	for <parisc-linux@thepuffingroup.com>; Fri, 28 Jul 2000 08:39:13 -0700 (PDT)
Message-Id: <200007281539.IAA26861@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: A simple question about readw, readw and the like
Date: Fri, 28 Jul 2000 08:39:11 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
Very nice summary of how linux drivers should use pci_dev->resources
and a peek at how user space will access PCI MEM space (ie Framebuffer).
(The latter is also a problem for HP-UX).

grant

----- Forwarded message from "David S. Miller" <davem@redhat.com> -----

Date: 	Thu, 27 Jul 2000 15:35:30 -0700
From: "David S. Miller" <davem@redhat.com>
To: abramo@alsa-project.org
CC: fw@fwconsult.com, linux-kernel@vger.rutgers.edu
In-reply-to: <39802159.1D04B244@alsa-project.org> (message from Abramo Bagnara
	on Thu, 27 Jul 2000 13:47:37 +0200)
Subject: Re: A simple question about readw, readw and the like
Precedence: bulk
X-Loop: 	majordomo@vger.rutgers.edu

   Date: Thu, 27 Jul 2000 13:47:37 +0200
   From: Abramo Bagnara <abramo@alsa-project.org>

   Does this means that there is no way to mmap the PCI IO space on
   any platform other than ia32?

One needs to be a bit more specific for me to give you an
answer :-)

Inside the kernel:

1) PCI I/O space is accessed by obtaining the base address via the
   appropriate pci_dev->resource[xxx] value, and feeding that directly
   into inb/inw/inl and friends.

2) PCI MEM space is accessed by obtaining the opaque MEM base cookie
   in pci_dev->resource[xxx], mapping it with ioremap(cookie), and
   feeding what you obtain from that to readw and friends.  When
   done with the MEM space area, you iounmap it.

For userspace things are much different.  It is nearly impossible to
be %100 portable for PCI I/O space.  On x86 you can just do inb
etc. instructions on the base address register value.  This fails to
work on just about every other system, you must actually mmap() the
PCI I/O space area needed on PPC, MIPS, Alpha, Sparc64, etc.

Honestly we lack a truly portable way to do this, and I am working on
a solution which will allow you to portably mmap I/O and MEM space PCI
areas via mmap() on /proc/bus/pci/xxx device nodes.  Just plain mmap
on /dev/mem is not a solution because that fails to work for 32-bit
userspace running on a 64-bit kernel, and besides this would require
that we give the user some way to find the base of I/O and MEM space
for a particular PCI controller in the machine.  The /proc/bus/pci
mmap solution hides all of this mess from userspace.

Later,
David S. Miller
davem@redhat.com

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.rutgers.edu
Please read the FAQ at http://www.tux.org/lkml/

----- End forwarded message -----

-- 
Revolutions do not require corporate support.
