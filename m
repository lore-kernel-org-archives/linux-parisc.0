From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Mon, 26 Nov 2007 16:27:39 -0700
Message-ID: <20071126232739.GB19757@colo.lackof.org>
References: <JS3V5C$A9DBFEF8AAD8958A4E1B90A528CCEE62@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <JS3V5C$A9DBFEF8AAD8958A4E1B90A528CCEE62@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Nov 26, 2007 at 09:48:48AM +0100, Joel Soete wrote:
...
> > The 12-bits per page (4k pages) is hard wired for the PA1.1 machines.
> >
> Ok but paper spoke of pa7200 (pa1.1) _and_ pa8000 (afaik pa2.0), so aware of
> new cpu capability, but my understanding is that I/O page size seems to me it
> could be different then cpu page size and would be fixed to 4k because of
> "Block ID" size of 12bits?

J/K first released with PA1.1. PA8000 (PA2.0) was release Jan 2006
 (See http://www.openpa.net/pa-risc_processors.html#xu) and I think this
paper was originally targeted at PA1.1. The reference to (12-bit) is probably
just a "bug" in updating the paper for PA2.0.

> That said, paper only spoke of J/K model.
> C1xx and Dxxx are model which looks like J but some subtitle difference could
> exist.

C1XX is UP. Dxxx is _very_ similar to J (SMP and many of the same IO options).

> > Right. PA2.0 machines can support variable page sizes and parisc-linux
> > has "almost working" support bigger page sizes.
> >
> What's up for hpux?

Can you be more specific?
hpux definitely support variable page sizes (Look for "POP" == Performance
Optimized Pagesize in HP literature in mid-late 1990's). But HPUX ccio driver
continues to use 4K pages because the IO TLB can't change the page size
for each TLB entry like the CPU TLB can.  AFAIK U2/U-Turn both are fixed
on which page size the support. That would work fine with linux since we
just increase the base page size (e.g. 16k or 64k pages for IA64).

> > > # while true ; do nice -n -3 tar -xspf linux-2.6.11-rc3-pa3.tar ; nice -n
> > > -3 rm -rf linux-2.6.11-rc3-pa3 ; date ; done
> >
> > Sorry...same questions again:
> > 	SMP or UP kernel?
> Sorry UP only (one pb at a time)
> [that said, my personal experiments with linux kernel (as well as hppa as
> i386) don't make me expect a lot of smp stuff]
> 
> > 	Which kernel version?
> >
> Currently 2.6.23-pa (kyle's pa git tree)
> (but pb was there since the beginning of 2.6. IIRC I made only very few test
> with 2.4)

hrm. ok...I'll try the same on one of my a500's and see if that's
reproduceable there as well.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
