From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Thu, 23 Jun 2005 14:46:08 -0600
Message-ID: <200506231446.08345.bjorn.helgaas@hp.com>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<20050623201807.GB28240@colo.lackof.org>
	<20050623203038.GD28881@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050623203038.GD28881@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 23 June 2005 2:30 pm, Kyle McMartin wrote:
> On Thu, Jun 23, 2005 at 02:18:07PM -0600, Grant Grundler wrote:
> > > Even without Astro VGA routing, the emulator or kernel could remap
> > > those accesses so they get routed to the correct bus.  But that's
> > > not enough, because then they won't appear on the bus in the
> > > 0x3b0-0x3df range that the card is expecting.
> > 
> > Given the above, we can poke any value we want in to the Elroy registers
> > in order to generate the right IO port space addresses.
> 
> Given this, it's probably feasible then to wrap (out|in)X with a
> vga_(out|in)X define in each of the drivers and emulate it as best we 
> can with Elroy?

The part I was talking about is for user-land.  Late last year,
Jesse Barnes added some new files in sysfs (see the bottom of
Documentation/filesystems/sysfs-pci.txt).

At the same time, they added some stuff to X to use these new
sysfs files for access to the legacy MMIO and I/O port ranges.
I don't think this has made it into a released X yet, but it's
in Xorg CVS.

I haven't really looked into the in-kernel accessors.  They'd
probably need work like you mention.  Ben H. proposed a VGA
arbiter that I think would be involved.  But my guess is that
you'd only need something like that if you want the in-kernel
framebuffer driver or something.  With the stuff Jesse added,
X can run the option ROM to initialize any card, so you may
not need the framebuffer drivers.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
