From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Sat, 1 Apr 2006 09:35:42 +0200
Message-ID: <200604010935.42819.deller@gmx.de>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be>
	<20060331155448.GP13590@parisc-linux.org>
	<20060401070236.GC23508@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060401070236.GC23508@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 01 April 2006 09:02, Grant Grundler wrote:
> On Fri, Mar 31, 2006 at 08:54:48AM -0700, Matthew Wilcox wrote:
> > 
> > Just so nobody else has to scratch their head looking at two
> > almost-identical dumps, the message Joel means is 
> > 
> > > Mar 31 11:45:39 patst006 kernel: allocation failed: out of vmalloc space - use
> > > vmalloc=<size> to increase size.
> 
> Ah - thanks. I saw that but wasn't sure it was the cause of discussion.
> 
> > Either we're leaking vmalloc space, we allocate too much of it, or we
> > need to drastically increase it the amount of it we have available.
> 
> It's odd that vmalloc fails so early in the boot sequence.
> At least the last 10 (of 14) PCI busses fail with the
> "allocation failed" message.
> Could this somehow be related to the IOREMAP changes?

I'm pretty sure.
We never vmalloc'ed IOmem before.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
