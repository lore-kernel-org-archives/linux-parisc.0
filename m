Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA04816
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 23:02:51 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3761EBB0.26A1931C@thepuffingroup.com>
Date: Sat, 12 Jun 1999 01:10:08 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: law@cygnus.com
CC: John David Anglin <dave@hiauly1.hia.nrc.ca>, jason@equator.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems
References: <21640.929159013@upchuck.cygnus.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law wrote:
> 
>   In message <199906120323.XAA29685@hiauly1.hia.nrc.ca>you write:
>   > image.  Finally, the .PARISC.unwind and .PARISC.symext must be
>   > loaded to the correct locations in the LIF image.
> You can throw away the unwind & symext sections.  While one day you might want
> the unwinders in your lif image, you'll never want the symext.
> 
> In the ELF tools, you shouldn't never end up with anything in $CODE$.  If
> you do, that's a bug in either the compiler or the assembler.  It should
> have mapped $CODE$ into .text.

Okay.  So this means there's a problem with the GNU ld code. Jeff, do
you know approximately where within the ld code we should be looking to
fix this?

I confess I'm starting to get a little lost with the segment placings. 
Everything I'm trying is producing nothing at all.  The latest I've
tried is linking with:

parisc-linux-ld -m hppaelf -Ttext 0x1000 -N -s \
     ipl_s.o ipl_c.o rom_interface.o ../../../lib/milli.o -o ipl

You can inspect this kernel, it's at
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-19990612-1

The IPL starts at 0x1000.

It would be very helpful to get a PIM dump as Kirk had provided earlier.

- Alex
