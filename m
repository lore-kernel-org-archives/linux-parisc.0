Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA05774
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 05:07:48 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <37624146.A7B5F0FE@thepuffingroup.com>
Date: Sat, 12 Jun 1999 07:15:18 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: law@cygnus.com
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems
References: <22030.929169143@upchuck.cygnus.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law wrote:
> 

<snip>

Okay, I can make that change, unless someone beats me to it.

> 
> Though I'm a little confused.  I thought y'all were dropping the existing ELF
> stuff -- I would strongly recommend it.  We're not even planning to keep the
> existing elf32-hppa stuff building in gas/binutils as we work on the rewrite.
> You're working with a totally dead and unsupported toolchain at this point.

Let me clear this up.

Yes, we are absolutely dropping any use of the current broken
instantiation of elf32-hppa.

However, there's this time gap between now and when we actually have the
new toolchain from Cygnus.  During this time, the only thing that we
expect to work on is the kernel and bootloader.  Having just those two
components building with the current gcc and linker are important.

When Cygnus delivers a new toolchain, we'll go for that.

If we don't do it this way, the only toolchain we'll have is hosted on
HPUX, which I want to avoid if I possibly can.  The
fix-build-boot-restart cycle is muuuuch faster if you can cross compile
and netboot, particularly for those people who only have one HPUX
machine and slow connectivity to the HPUX box that HP has online for us.

Does that make sense?

- Alex
