From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Wed, 05 Apr 2006 20:02:53 -0400
Message-ID: <1144281773.3214.2.camel@mulgrave.il.steeleye.com>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be>
	 <20060403012831.GB12037@colo.lackof.org>
	 <1144152354.3425.21.camel@mulgrave.il.steeleye.com>
	 <200604050850.06058.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org,
 Grant Grundler <grundler@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <200604050850.06058.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 2006-04-05 at 08:50 +0200, Helge Deller wrote: 
> > I suggest that on 32 bits, we really shouldn't alter the current scheme
> > (i.e. keep the separated I/O and  memory mappings).  On 64 bits, we
> > could allocate a far different VM range to vmalloc (somewhere up beyond
> > the maximum possible physical memory) and thus make it far bigger, which
> > would allow us to keep a mapped ioremap implementation.
> 
> Might work, although it makes the sources pretty ugly again.
> The biggest problem with 64bit kernel and seperated I/O and memory mappings was, that you wasn't able to export I/O-memory via mmap() to 32bit userspace applications.
> Biggest affected application was X11, who tried to mmap() the 64bit f-space region of the graphics RAM into 32bit-userspace.
> This might maybe be maybe solveable with your proposal, since e.g. X11 on 32bit Kernel worked already somehow and 64bit could be solved with the mapping.

I suspected it might be something like this.  Actually, ioremap looks to
be the wrong interface to fix this.  The problem seems to be that
fb_mmap() in drivers/video/fb.c has a special fall through case if the
driver doesn't implement fb_mmap() which tries to insert page mappings
for the I/O memory region into the users space, this fall through
doesn't seem to be correct for 64 bits (or at least for 32 bit processes
running on a 64 bit kernel) ... I think if we fix this, we'll get
graphics on 64 bit without the need to remap I/O memory.

James
