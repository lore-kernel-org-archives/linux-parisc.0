Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA06970
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 15:14:25 -0600
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sat, 12 Jun 1999 07:15:18 EDT.
             <37624146.A7B5F0FE@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 12 Jun 1999 15:09:21 -0600
Message-ID: <23436.929221761@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <37624146.A7B5F0FE@thepuffingroup.com>you write:
  > Jeffrey A Law wrote:
  > > 
  > 
  > <snip>
  > 
  > Okay, I can make that change, unless someone beats me to it.
Let me know if it helps.  That change is just an educated guess :-)


  > However, there's this time gap between now and when we actually have the
  > new toolchain from Cygnus.  During this time, the only thing that we
  > expect to work on is the kernel and bootloader.  Having just those two
  > components building with the current gcc and linker are important.
OK.  But note Cygnus is _NOT_ currently scheduled or contracted to provide a
32bit ELF toolchain.  Cygnus will be providing a 64bit ELF toolchain which
folks can use to derive much of the 32bit toolchain.
  > 
  > If we don't do it this way, the only toolchain we'll have is hosted on
  > HPUX, which I want to avoid if I possibly can.  The
  > fix-build-boot-restart cycle is muuuuch faster if you can cross compile
  > and netboot, particularly for those people who only have one HPUX
  > machine and slow connectivity to the HPUX box that HP has online for us.
I understand.  I'm still skeptical that you're going to end up burning
more time fighting those lame elf tools than you would by building with
SOM tools.

Of course, if you had two HP machines, then this is a non-issue :-)

jeff
