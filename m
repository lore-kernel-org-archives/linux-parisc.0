From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Tue, 27 Nov 2007 13:48:32 +0100
Message-ID: <JS60WW$8607DD1A85ED3939F455D3059DCDCF43@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: "grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, Nov 26, 2007 at 09:48:48AM +0100, Joel Soete wrote:
> ...
> > > The 12-bits per page (4k pages) is hard wired for the PA1.1 machines.
> > >
> > Ok but paper spoke of pa7200 (pa1.1) _and_ pa8000 (afaik pa2.0), so aware of
> > new cpu capability, but my understanding is that I/O page size seems to me it
> > could be different then cpu page size and would be fixed to 4k because of
> > "Block ID" size of 12bits?
> 
> J/K first released with PA1.1. PA8000 (PA2.0) was release Jan 2006
>  (See http://www.openpa.net/pa-risc_processors.html#xu) and I think this
> paper was originally targeted at PA1.1. The reference to (12-bit) is probably
> just a "bug" in updating the paper for PA2.0.
> 
grr even thought I read well:
"[snip]
Hardware Implications
Cache memory is defined as a small, high-speed block of memory located close
to the processor. On the HP PA 7200 and PA8000 processors, a portion of the
software virtual address (called the virtual index) is used as the cache lookup.
[snip]"

That's what confusing me, sorry.

> > That said, paper only spoke of J/K model.
> > C1xx and Dxxx are model which looks like J but some subtitle difference could
> > exist.
> 
> C1XX is UP. Dxxx is _very_ similar to J (SMP and many of the same IO options).
> 
> > > Right. PA2.0 machines can support variable page sizes and parisc-linux
> > > has "almost working" support bigger page sizes.
> > >
> > What's up for hpux?
> 
> Can you be more specific?
> hpux definitely support variable page sizes 

Exactely what am I curious about ;-)

>(Look for "POP" == Performance
> Optimized Pagesize in HP literature in mid-late 1990's).
Ok I will have a look.

> But HPUX ccio driver
> continues to use 4K pages because the IO TLB can't change the page size
> for each TLB entry like the CPU TLB can.
Nice to know ;-)

>  AFAIK U2/U-Turn both are fixed
> on which page size the support. That would work fine with linux since we
> just increase the base page size (e.g. 16k or 64k pages for IA64).
> 
Well, reading further, even thought it seems to be 'programmable':
"[snip]
A second feature of this scheme is that it helps limit the overhead of the I/O
page directory. Recall that the I/O page directory contains all active address
translations and must be memory-resident. I/O page directory size is equal to
the size of one entry times 2^k, where k is the number of chain ID bits plus
the number of block ID bits. The division between the chain ID and the block
ID is programmable, as is the total number of bits (k), so software can reduce
the memory overhead of the I/O page directory for systems with smaller I/O
subsystems if we guarantee that the leading address bits are zero for these
smaller systems.
[snip]"

That said I discover a difference between my d380 and c110 config:
for c110 no CONFIG_EISA support,
for d380 CONFIG_EISA yes

which is in fact a hack like mentioned in comments:
/*
** DMA "Page Type" and Hints
[snip]
** o STOP_MOST is needed for atomicity across cachelines.
**   Apparently only "some EISA devices" need this.
**   Using CONFIG_ISA is hack. Only the IOA with EISA under it needs
**   to use this hint iff the EISA devices needs this feature.
**   According to the U2 ERS, STOP_MOST enabled pages hurt performance.
[snip]
**
** FIXME: the default hints need to be per GSC device - not global.
**
** HP-UX dorks: linux device driver programming model is totally different
**    than HP-UX's. HP-UX always sets HINT_PREFETCH since it's drivers
**    do special things to work on non-coherent platforms...linux has to
**    be much more careful with this.
*/
#define IOPDIR_VALID    0x01UL
#define HINT_SAFE_DMA   0x02UL  /* used for pci_alloc_consistent() pages */
#ifdef CONFIG_EISA
#define HINT_STOP_MOST  0x04UL  /* LSL support */
#else
#define HINT_STOP_MOST  0x00UL  /* only needed for "some EISA devices" */
#endif
#define HINT_UDPATE_ENB 0x08UL  /* not used/supported by U2 */
#define HINT_PREFETCH   0x10UL  /* for outbound pages which are not SAFE */
[snip]"

So make a difference in HINT_STOP_MOST value.
Anyway, may be could it help to delay also a bit issue on c110 as on d380 (may
be enough to re-install the system?)

That siad, the above mentioned paper spoke about "Atomic or locked mode": is
it this HINT_STOP_MOST which enable this mode?


> > > > # while true ; do nice -n -3 tar -xspf linux-2.6.11-rc3-pa3.tar ; nice -n
> > > > -3 rm -rf linux-2.6.11-rc3-pa3 ; date ; done
> > >
> > > Sorry...same questions again:
> > > 	SMP or UP kernel?
> > Sorry UP only (one pb at a time)
> > [that said, my personal experiments with linux kernel (as well as hppa as
> > i386) don't make me expect a lot of smp stuff]
> > 
> > > 	Which kernel version?
> > >
> > Currently 2.6.23-pa (kyle's pa git tree)
> > (but pb was there since the beginning of 2.6. IIRC I made only very few test
> > with 2.4)
> 
> hrm. ok...I'll try the same on one of my a500's and see if that's
> reproduceable there as well.
> 
What's your idea (afaik a500 didn't use ccio nor ncr53c720)?

Thanks again,
    J.
> hth,
> grant
> 
> 
---
Pack Scarlet One, ADSL 6 Mbps + Telephonie, a partir de EUR 29,95...
http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
