From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Generic IRQ support
Date: Thu, 9 Dec 2004 22:51:40 -0700
Message-ID: <20041210055140.GC26739@colo.lackof.org>
References: <20041209152944.GP10881@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041209152944.GP10881@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 09, 2004 at 03:29:44PM +0000, Matthew Wilcox wrote:
> 
> I've been looking at using the new generic IRQ code for PA, and I think
> we can do it.

Yes - it's certainly feasible.
I've proposed something similar several years ago:
    http://lists.parisc-linux.org/pipermail/parisc-linux/2000-October/009640.html

Last year Thibaut Varene and I even took a run at it.
Our goal was to pickup/add generic support for IRQ affinity.
We got ~60% done after a few monthes but ran out of time.

> The irq_regions code has to go, of course.  The data structures used by
> the generic code are just incompatible.  So the new scheme looks like
> this:
> 
> An irq number is just a small integer.  Skipping 0-15 as being legacy
> isa/eisa/suckyio (maybe) interrupts, we start allocating irq numbers
> at 16.  Each interrupt (as opposed to each interrupt region) has its own
> vector of irq operations.  Mostly they'll be the same, but this lets us
> allocate the irq numbers in an arbitrary way.

yup - that should work fine.

> 
> Machines with iosapic have one CPU interrupt per iosapic interrupt,
> so we can get rid of the hierarchy.  The iosapic still needs to be told
> that we've finished processing the interrupt, but that can be done by
> the ->end method.

We can't entirely get rid of the hierarchy.
There are configurations where we might have to share a CPU EIR.
Since N-class is working now, I'm mostly concerned about it on that
class of platform. Especially if we want to support MSI or MSI-X.

> Native devices (such as Zalon/Bluefish) also need no hierarchy.  They
> just take a CPU interrupt.
> 
> For lasi/dino/wax/asp (hereinafter referred to as lasi), we really do
> have hierarchical interrupts.  So lasi will take a native interrupt,
> then reads the status register, translates that to a Linux interrupt
> number and calls __do_irq() again.
> 
> EISA is just as much fun, only it goes through an additional layer of
> indirection; we call wax's IRQ handler which decodes its status register
> and calls the EISA interrupt handler, which decodes its status register
> and calls the driver's interrupt handler.
> 
> I intend to get iosapic & suckyio working under this scheme, then post
> what I have.  At that point, someone else can step in and do old-gsc
> devices ;-)

You probably want to look at the source tree from Thibaut since
that's basically the same approach we took then...most of the
changes should still apply.
Please poke (gently) if I can help.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
