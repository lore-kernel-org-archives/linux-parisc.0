Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA06724
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 13:36:57 -0600
Date: Sat, 12 Jun 1999 21:36:49 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, adevries@thepuffingroup.com,
        law@cygnus.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems
Message-ID: <19990612213649.Y31472@mencheca.ch.genedata.com>
References: <199906121657.MAA02162@hiauly1.hia.nrc.ca> <E10sse6-0004NC-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E10sse6-0004NC-00@the-village.bc.nu>; from Alan Cox on Sat, Jun 12, 1999 at 07:36:44PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jun 12, 1999 at 07:36:44PM +0100, Alan Cox wrote:
> > relocations.  A SOM linker also needs to be stream based.  Thus,
> > it appears difficult (impossible?) to build a SOM linker using the
> > bfd architecture.  On the other hand, the elf32-hppa tools have serious
> > deficiencies and are about to be completely rewritten.  Might it not be
> > better to develop a SOM linker rather than rewrite the elf stuff?
> 
> Writing a linker, especialyl for something complex like SOM is not trivial
> in the slightest.

Yes, if you really want to support SOM properly and follow the spec.
It probably isn't if you want to just deal with what actually exists in
the world.  If you look at page 6-125 of the `32-bit PA-RISC Run-Time
Architecture Document 11.0 Version 1.0', it says that all conforming
executable SOM files must have the `exec auxiliary header (also known as
the HP-UX header with Hewlett-Packard)'.

So in the binfmt_som loader I take this opportunity to ignore the
wonderfully flexible and expressive structure that is contained in the SOM
file format and just map the text, data and bss segments from the file.
I imagine that a SOM linker which did just enough to get a kernel up
and running would not be too hard to write.  On the other hand, I can
think of a dozen more interesting and productive things to do.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
