Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA07127
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 15:21:00 -0600
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sat, 12 Jun 1999 21:36:49 +0200.
             <19990612213649.Y31472@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 12 Jun 1999 15:15:28 -0600
Message-ID: <23459.929222128@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <19990612213649.Y31472@mencheca.ch.genedata.com>you write:
  > Yes, if you really want to support SOM properly and follow the spec.
  > It probably isn't if you want to just deal with what actually exists in
  > the world.  If you look at page 6-125 of the `32-bit PA-RISC Run-Time
  > Architecture Document 11.0 Version 1.0', it says that all conforming
  > executable SOM files must have the `exec auxiliary header (also known as
  > the HP-UX header with Hewlett-Packard)'.
The headers are the easy part.  Really.  It's the relocations that are such
a bear.


  > So in the binfmt_som loader I take this opportunity to ignore the
  > wonderfully flexible and expressive structure that is contained in the SOM
  > file format and just map the text, data and bss segments from the file.
  > I imagine that a SOM linker which did just enough to get a kernel up
  > and running would not be too hard to write.  On the other hand, I can
  > think of a dozen more interesting and productive things to do.
If you look at the SOM exec aux header, it effectively gives you the old
traditional text, data, bss.   That's its purpose in life -- to glom together
all the readonly loadable things into ".text", read-write initialized into
".data" and everything else into .bss.   The ELF folks in the crowd will
recognize this as the program vs object viewpoints of an ELF file.


While "just a kernel linker" does simplify things (no need for shared libraries
and the shitloads of stubs they involve), you've still got a large, nontrivial
project on your hands.  It would *still* be easier to sit down and rewrite the
elf32 tools than to do a kernel-only SOM linker.

If you're really sadistic, look at the way calls relocs are handled.



jeff
