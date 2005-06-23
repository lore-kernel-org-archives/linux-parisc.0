From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Thu, 23 Jun 2005 13:09:14 -0600
Message-ID: <20050623190914.GA28240@colo.lackof.org>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<20050615190616.GA29652@colo.lackof.org>
	<200506201445.19818.bjorn.helgaas@hp.com>
	<20050621020605.GB12189@colo.lackof.org>
	<20050623185925.GB28881@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Bjorn Helgaas <bjorn.helgaas@hp.com>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050623185925.GB28881@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 23, 2005 at 02:59:25PM -0400, Kyle McMartin wrote:
> > ie a "directed range" could be programmed to redirect accesses from
> > MMIO space to a particular Elroy. Requires programming a directed
> > range in Astro and a matched "Extra LMMIO" range in Elroy.
> > I've never messed with this and always depended on firmware
> > to deal with range registers.
> >
> 
> I've been looking at the Astro and Elroy ERS trying to understand
> this. Does this mean that even if the "VGA Enable" logic is broken,
> we could still force VGA accesses to be routed to a specific PCI 
> device, or are we out of luck?

We can force any MMIO accesses to any rope with "Directed Ranges" on Astro.
We can NOT force IO Port accesses to anything.

> If it's feasible, I'm willing to take some time to look into this.

I'm not sure it's "feasible" unless we can get around IO Port space
routing issues.

grant

> 
> Cheers,
> -- 
> Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
