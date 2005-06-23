From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Thu, 23 Jun 2005 14:18:07 -0600
Message-ID: <20050623201807.GB28240@colo.lackof.org>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<20050623185925.GB28881@roadwarrior.mcmartin.ca>
	<20050623190914.GA28240@colo.lackof.org>
	<200506231324.21482.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506231324.21482.bjorn.helgaas@hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 23, 2005 at 01:24:21PM -0600, Bjorn Helgaas wrote:
> > I'm not sure it's "feasible" unless we can get around IO Port space
> > routing issues.
> 
> If the IO port routing is broken, I don't know whether we can do
> anything useful.  X emulates the option ROM to initialize the card,
> and the ROM typically does IO port accesses that have to appear on
> the bus as accesses in the 0x3b0-0x3df range.

On parisc the emulator would have to call into the Elroy PCI
support (drivers/parisc/lba_pci.c) to generate the IO port accesses.
Ie parisc has no "load/store IO Port space" instructions.
It all has to be done by directly poking the Elroy registers
on the right elroy.

IA64 could do this as well but doesn't have an "lba_pci.c" driver.
Everything is "nicely" encapsulate by SAL calls and IA64 can
directly generate IO Port space load/stores (in/out) so it
wouldn't normally need a PCI Host Bus controller driver.


> Even without Astro VGA routing, the emulator or kernel could remap
> those accesses so they get routed to the correct bus.  But that's
> not enough, because then they won't appear on the bus in the
> 0x3b0-0x3df range that the card is expecting.

Given the above, we can poke any value we want in to the Elroy registers
in order to generate the right IO port space addresses.


grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
