From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Generic IRQ support
Date: Thu, 9 Dec 2004 15:29:44 +0000
Message-ID: <20041209152944.GP10881@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


I've been looking at using the new generic IRQ code for PA, and I think
we can do it.

The irq_regions code has to go, of course.  The data structures used by
the generic code are just incompatible.  So the new scheme looks like
this:

An irq number is just a small integer.  Skipping 0-15 as being legacy
isa/eisa/suckyio (maybe) interrupts, we start allocating irq numbers
at 16.  Each interrupt (as opposed to each interrupt region) has its own
vector of irq operations.  Mostly they'll be the same, but this lets us
allocate the irq numbers in an arbitrary way.

Machines with iosapic have one CPU interrupt per iosapic interrupt,
so we can get rid of the hierarchy.  The iosapic still needs to be told
that we've finished processing the interrupt, but that can be done by
the ->end method.

Native devices (such as Zalon/Bluefish) also need no hierarchy.  They
just take a CPU interrupt.

For lasi/dino/wax/asp (hereinafter referred to as lasi), we really do
have hierarchical interrupts.  So lasi will take a native interrupt,
then reads the status register, translates that to a Linux interrupt
number and calls __do_irq() again.

EISA is just as much fun, only it goes through an additional layer of
indirection; we call wax's IRQ handler which decodes its status register
and calls the EISA interrupt handler, which decodes its status register
and calls the driver's interrupt handler.

I intend to get iosapic & suckyio working under this scheme, then post
what I have.  At that point, someone else can step in and do old-gsc
devices ;-)

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
