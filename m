Return-Path: <jim.hull@hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 842244838
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 11:48:57 -0600 (MDT)
From: "Jim Hull" <jim.hull@hp.com>
To: "'Matthew Wilcox'" <willy@debian.org>,
	"'Randolph Chung'" <tausq@debian.org>
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] 7300LC
Date: Mon, 26 Apr 2004 10:48:56 -0700
Message-ID: <010f01c42bb6$bf5864e0$f463f40f@jh733133>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20040426115918.GO22558@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

The prefetch for read (using LDW) vs. prefetch for write (using LDD) applies
only to PA2.0 processors.  PA1.1 processors (including the 7300LC), since
they're only 32-bit machines, don't implement LDD (64-bit load).  For PA1.1,
there's only one kind of prefetch, using LDW.

 -- Jim
    HP PA-RISC/Itanium Processor Architect

> -----Original Message-----
> From: parisc-linux-bounces@lists.parisc-linux.org 
> [mailto:parisc-linux-bounces@lists.parisc-linux.org] On 
> Behalf Of Matthew Wilcox
> Sent: Monday, April 26, 2004 4:59 AM
> To: Randolph Chung
> Cc: Matthew Wilcox; parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] Re: [parisc-linux-cvs] 7300LC
> 
> 
> On Sun, Apr 25, 2004 at 06:41:11PM -0700, Randolph Chung wrote:
> > willy, kyle found out that this doesn't work:
> > 
> > > > Split out 7300LC from 7100LC and PREFETCH from PA20.
> > 
> > extern inline void prefetchw(const void *addr)
> > {
> >         __asm__("ldd 0(%0), %%r0" : : "r" (addr));
> > }
> > 
> > on pa11 gas won't assemble the ldd insn.
> > 
> > is this supposed to work for pa7300lc? if so we might have 
> to rewrite
> > prefetchw to use a .word or something...
> 
> It is supposed to work, yes.  I gleaned this information from
> http://cpus.hp.com/technical_references/b7300lc.shtml section 2.2.4
> The 7300LC ERS (http://ftp.parisc-linux.org/docs/chips/pcxl2_ers.pdf)
> is of no help in this matter.  In section 14.5, it says:
> 
>   Because the processor does not necessarily stall even with two cache
>   misses pending, software prefetching can lead to better performance
>   increases than on the PA7100LC. This is because a software prefetch,
>   initiated by a load to general register 0, is not treated like a
>   load miss by the data cache and therefore can be completed in the
>   ``background'' by the hardware and is less likely to cause processor
>   stalls.
> 
> But, thinking about it, PA7300LC isn't SMP-capable.  Is there any
> difference between prefetch-for-read and prefetch-for-write on a
> uniprocessor system?  I don't think so.  So possibly we should just
> define prefetchw to be the same as prefetch for CONFIG_PA7300LC and
> different for CONFIG_PA20.  Makes sense?
> 
> -- 
> "Next the statesmen will invent cheap lies, putting the blame upon 
> the nation that is attacked, and every man will be glad of those
> conscience-soothing falsities, and will diligently study 
> them, and refuse
> to examine any refutations of them; and thus he will by and 
> by convince 
> himself that the war is just, and will thank God for the better sleep 
> he enjoys after this process of grotesque self-deception." -- 
> Mark Twain
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
