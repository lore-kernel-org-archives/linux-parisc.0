From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Mon, 6 Jul 2009 14:45:37 -0400 (EDT)
Message-ID: <20090706184539.5A76D4FE0@hiauly1.hia.nrc.ca>
References: <119aab440907060936x7051933fgfde585df640ca1b1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: randolph@tausq.org, James.Bottomley@hansenpartnership.com,
	deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org, kyle@mcmartin.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907060936x7051933fgfde585df640ca1b1@mail.gmail.com> from "Carlos O'Donell" at Jul 6, 2009 12:36:16 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I will reiterate my point here that the dynamic linker the first user
> of mmap in a newly started process, and the first program to read and
> process data from the mmap'd files. Therefore the dynamic linker is
> always the first to suffer if a mapped region of memory is not
> correct.

That is true to a certain extent.  However, there are large portions
of code and initialized data that it doesn't touch.  I don't think
that I've ever seen an invalid instruction fault.  So, I'm not fully
convinced that we understand the cause of these segvs.

As far as I can tell, the mmap'd data appears correct (at least as
far as what was recorded in the core file).  What is wrong is the
l_info field in the linker map.  Prior to failing on processing
libdl.so.2, it had successfully processed itself and libncurses.so.5
(see NEEDED entries for /bin/sh).  There isn't a lot that happens
between mmap'ing the file and the access to the STRTAB entry in
the l_info field.  The NEEDED entry at l_info[1] seems ok in the
dump.

I doubt this is a TLB issue as the data is a long way from page
boundaries.  Possibly, there is a cache line issue in the mmap'd
file, or as I suggested before a race condition and the file isn't
fully mapped when the mmap call returns.  In any case, the extraction
of the dynamic data failed after doing the first NEEDED entry.

I have to think that this has something to do with the machine
being a rp3440 (large memory and cache).  I have never seen this
on my c3750 with 32-bit UP kernel.  Also, this was with a 64-bit
UP kernel.

> What we need to do here is create a test case.
> 
> I tried this:
> 
> 1. cp /lib/libc.so.6 original.so
> 2. cp /lib/libc.so.6 map.so
> 3. gcc -O2 -g -o test-mmap test-mmap.c
> 4. while true; do ./test-mmap ./original.so ./map.so; done;
> 
> The test mmap's a file and compares it to the original, aborting if
> the comparison fails. I've yet to see it abort on my a500, and I've
> run 20-30 instances of the test simultaneously. Then again I don't see
> any serious segv's like others do (2.6.26-1-parisc64-smp).
> 
> What might be a better testcase?

I typically run my GCC builds with `make -j 4'.  So, there's a mix
of other stuff actively running at any time.

I'll give the testcase a try tonight.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
