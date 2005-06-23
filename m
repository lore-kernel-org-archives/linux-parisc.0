From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Thu, 23 Jun 2005 16:30:38 -0400
Message-ID: <20050623203038.GD28881@roadwarrior.mcmartin.ca>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<20050623185925.GB28881@roadwarrior.mcmartin.ca>
	<20050623190914.GA28240@colo.lackof.org>
	<200506231324.21482.bjorn.helgaas@hp.com>
	<20050623201807.GB28240@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Bjorn Helgaas <bjorn.helgaas@hp.com>
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

On Thu, Jun 23, 2005 at 02:18:07PM -0600, Grant Grundler wrote:
> > Even without Astro VGA routing, the emulator or kernel could remap
> > those accesses so they get routed to the correct bus.  But that's
> > not enough, because then they won't appear on the bus in the
> > 0x3b0-0x3df range that the card is expecting.
> 
> Given the above, we can poke any value we want in to the Elroy registers
> in order to generate the right IO port space addresses.
> 

Given this, it's probably feasible then to wrap (out|in)X with a
vga_(out|in)X define in each of the drivers and emulate it as best we 
can with Elroy?

Sorry if I'm misunderstanding, this is over my head right now. :)
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
