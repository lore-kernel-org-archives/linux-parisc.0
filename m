Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA04979
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 23:16:16 -0600
To: Alex deVries <adevries@thepuffingroup.com>
cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, jason@equator.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sat, 12 Jun 1999 01:10:08 EDT.
             <3761EBB0.26A1931C@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 11 Jun 1999 23:11:17 -0600
Message-ID: <21833.929164277@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <3761EBB0.26A1931C@thepuffingroup.com>you write:
  > > In the ELF tools, you shouldn't never end up with anything in $CODE$.  If
  > > you do, that's a bug in either the compiler or the assembler.  It should
  > > have mapped $CODE$ into .text.
  > 
  > Okay.  So this means there's a problem with the GNU ld code. Jeff, do
  > you know approximately where within the ld code we should be looking to
  > fix this?
No, it's in either gas or gcc, not gld.

To find it you first need to find the offending .o file.  Then we'll look at
the .s it's built from, then possibly walk backwards to the compiler itself
depending on what we find.

To find the offending .o file with a $CODE$ use something like

objdump -h *.o ../../../lib/milli.o > /tmp/BLAH

Then search for $CODE$ in the resulting /tmp/BLAH.  We'll work backwards from
what you find.

  > It would be very helpful to get a PIM dump as Kirk had provided earlier.
Look at trap.c in the Utah code.   It had some of this kind of stuff.  Though
it assumes that you can run long enough to get your own trap handlers
installed.

jeff
