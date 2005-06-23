From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Thu, 23 Jun 2005 14:22:14 -0600
Message-ID: <200506231422.14208.bjorn.helgaas@hp.com>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<200506231324.21482.bjorn.helgaas@hp.com>
	<20050623201807.GB28240@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050623201807.GB28240@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 23 June 2005 2:18 pm, Grant Grundler wrote:
> On parisc the emulator would have to call into the Elroy PCI
> support (drivers/parisc/lba_pci.c) to generate the IO port accesses.
> Ie parisc has no "load/store IO Port space" instructions.
> It all has to be done by directly poking the Elroy registers
> on the right elroy.

> > Even without Astro VGA routing, the emulator or kernel could remap
> > those accesses so they get routed to the correct bus.  But that's
> > not enough, because then they won't appear on the bus in the
> > 0x3b0-0x3df range that the card is expecting.
> 
> Given the above, we can poke any value we want in to the Elroy registers
> in order to generate the right IO port space addresses.

Hmmm....  very interesting idea.  The hook is already there
(ia64_pci_legacy_read() is an example for ia64), so parisc
could implement something similar that poked Elroy directly.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
