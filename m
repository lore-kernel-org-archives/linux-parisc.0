Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03276
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 09:05:27 -0700
Date: Tue, 16 Nov 1999 17:08:19 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: frowand@cup.hp.com
Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] depi?
Message-Id: <19991116170819.B750@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <383093DE.A8B73CE4@hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> This is just one of several recent messages dealing with the issues caused by
> locating the kernel at virtual address 0xc0000000 instead of 0x00000000.  I
> still don't understand why the kernel can't be at zero, even though several
> people have tried to explain it to me.  Can anyone provide a clear
> explanation?

Advantages of mapping the kernel at 0xc000 0000 (or 0x8000 0000/0xe000 0000)

 - consistent with what the other ports do / what hardware does for the other
   ports (MIPS)
 - clear difference between user pointers and kernel pointers (this matters
   for debugging, not for a running system)
 - clear difference between physical addresses and kernel pointers.  Think
   about vmalloc for one reason this is a good thing.  Also I dislike the
   idea of staring at HPMCs for hours just to find out what really happened
   is someone forgot to set the D bit and we didn't notice until we happened
   to hit a vmalloc area.
 - allows us not to use space registers at all (this might be a nice option
   to have, though it will give us a performance hit)
 - allows us to catch NULL pointers and use large pages to map the physical
   memory [1]
 - is already implemented

Disadvantages

 - conflicts with a rather obscure restriction of PA1.1 cache aliases.  As
   Frank pointed out to me, it is only guaranteed you access the same data
   using a physical address and a virtual address mapped to the physical if
   the physical address is equal to the virtual address (or you are flushing
   the cache lines in question).  I do not believe this to be a real problem
   with any existing hardware and if it is, the performance hit of the
   additional cache flushes may be seen as proper punishment for brain-dead
   hardware.
 - It is not what existing OSes on PA-RISC do.  Whether this really is a dis-
   advantage I'm not sure (it might serve HP engineers as a reminder that this
   is not HP/UX and keep them from doing things the HP/UX way even where it is
   inferior).
 - It adds some depi instructions, some of them in important code paths.
 - it adds some human depi instructions during debugging (Ie you see an oops
   for virtual address 0xc200 XXXX and it takes you some time to figure out
   this really is because you only have 32 MB and something disagreed (this
   is a real world example I saw several times while debugging interruption
   handlers that got called recursively))
 - it causes some additional complexity during booting (though Paul Bame has
   send a simple way to work-around those to the list some time ago).

basically this situation is very similar to your typical twice-a-year endian-
ness debate (surprisingly so.  compare "clear difference between kernel/user
pointers" "clear difference between integers of different sizes", "depi
instructions" "byte-swapping", "human depi" "reading data dumped as bytes
the wrong way around").

Unless it turns out that there are CPUs around which rely on the obscure
condition mentioned above (if there is any HP guy around who can confirm/deny
this it would be of great help), or other unexpected advantages of mapping
the physical memory starting at 0x0000 0000, I don't see this as being a good
idea.
 
If you have additional points to make in favour of / against mapping the memory
at 0x0000 0000, please reply as soon as possible.


	Philipp Rumpf

[1] PA2.0 supports arbitrary power-of-four page sizes between 4 KB and, depen-
ding on the CPU, up to 1 GB.  Of course, those pages have to be aligned.  So
to map 1 GB of physical memory, but leaving the first page unmapped (as you
would do to catch NULL pointers), you would need:

3   4 KB-pages
3  16 KB-pages
3  64 KB-pages
3 256 KB-pages
3   1 MB-pages
...
3 256 MB-pages.

I.e. 27 pages compared to one 1 GB page for the 0xc000 0000 case.  It's not
as terrible as it sounds but it is added complexity.
