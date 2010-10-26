From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Tue, 26 Oct 2010 00:30:31 -0400 (EDT)
Message-ID: <20101026043031.C1A1D4FB5@hiauly1.hia.nrc.ca>
References: <20101026030442.GS8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: mikulas@artax.karlin.mff.cuni.cz, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101026030442.GS8332@bombadil.infradead.org> from "Kyle McMartin" at Oct 25, 2010 11:04:42 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I found that gcc 4.3 from Debian 5 is buggy, it miscompiled the UP kernel. 
> > Compiling it with -Os worked fine. Could you please recommend a compiler 
> > to use? (4.4 from Debian 6 ... or some other version?)
> > 
> 
> 4.4.5 from sid is what I'm using... I think it's working more or less
> for me. I've only been building/booting UP/SMP on an rp3440 these days,
> so I'm not sure about 32-bit.

Almost all the bugs are middle-end problems.  Gradually, things have
been getting better, but resolving wrong code bugs is often difficult,
particularly if the compiler has been miscompiled.

Some of the things that hurt:
a) Strict alignment and wierd abi for passing structs.
b) Callee copies (almost all other archs are caller copy).

Recently, a serious bug in forward propagation was discovered.  It's
hard to tell the magnitude of its impact.

> > > our cache flushing is a bit... suboptimal right now (doing whole cache
> > > flushes on fork and such.)
> > 
> > What is exactly the problem there? Could you describe it or refer to some 
> > document that describes it? Why do you need to flush on fork?
> > 
> > Sparc has virtually indexed caches too, but there are not many problems 
> > with it, basically the only needed thing is to flush the cache when kernel 
> > touches some user page via its own mapping. (if they ran with 16kB page 
> > size, they wouldn't have to care about data cache coherency at all).
> > 
> 
> I can't remember exactly why offhand, I'm sure jejb can remind us.

The fundamental issue is the PA-8800 and PA-8900 implementations
don't support non equivalent aliasing.  So, copies to/from the
kernel mapping are tricky.

> That's the output from one of the firmware queries, which has been lying
> to us for a very long time (apparently HP just doesn't test these things
> or something.) It believe the pa8800 L1 caches were 4-way associative.
> 
> So, on to the interesting bit!
> 
> Does your /proc/cpuinfo actually say 768kB? That's... amazingly
> interesting. I wonder (out loud, sorry I should go back and look at the
> prior emails) if that's the cause of your cpu issues...
> 
> processor       : 0
> cpu family      : PA-RISC 2.0
> cpu             : PA8800 (Mako)
> cpu MHz         : 999.995500
> capabilities    : os64
> model           : 9000/800/rp3440  
> model name      : Storm Peak Fast
> hversion        : 0x00008890
> sversion        : 0x00000491
> I-cache         : 32768 KB
> D-cache         : 32768 KB (WB, direct mapped)
> ITLB entries    : 240
> DTLB entries    : 240 - shared with ITLB
> bogomips        : 1998.84
> software id     : 4468984695822677774
> 
> is what mine says... (with the 32MB L2 cache.)

My inspection of the datasheets for the c8000 indicated that the base
configuration was 2-way with no L2 cache (both PA8800 and PA8900).
It had a total cache size of 3 MB.  The optional PA8800 models were
2 and 4-way PA8800 with 32 MB L2 cache per processor module.  The optional
PA8900 models had 64 MB L2 per processor module.

Also, Mikulas machine is misidentified as Mako2.  Why does the model
for yours show it is a rp3440?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
