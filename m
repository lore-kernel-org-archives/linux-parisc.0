From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Sat, 19 Feb 2005 04:17:59 -0600
Message-ID: <200502190417.59359.mszick@wolfbutter.com>
References: <20050218062312.GA11968@colo.lackof.org>
	<20050218092835.0E74E3658E2@mail.esiee.fr>
	<20050219022808.GA28925@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050219022808.GA28925@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri February 18 2005 20:28, Grant Grundler wrote:
> On Fri, Feb 18, 2005 at 10:28:26AM +0100, Thibaut VARENE wrote:
> > > The only difference in the .config was sym2 driver IOMAPPED.
> > > I had it enabled (using IO Port space) and now disable it
> > > since I really want MMIO space. I'm very skeptical this is
> > > related to the problem.
> > 
> > Hmmm.
> > Back in the early days of 2.5, i recall issues with SYM2 in MMIO mode,
> > so that it only worked in PIO mode (I think i had posted something on
> > this m-l about that). At that time i was using ext3 for that matter.
> > 
> > OTOH, XFS relies a lot on memory and cache quality. I don't know how
> > MMIO would interfere with that, but I suspect that if enabling MMIO
> > has the side effect of messing with that somehow, it's very likely XFS
> > won't like it at all. Just a random thought though.
> 
> *sigh* Using IO Port space works. Either there is a bug in the Sym2
> driver (not posting writes when it needs to) or the lower cost of
> the MMIO writes is changing the timing enough to expose bugs
> in other subsystems.
> 
A note,
There are recent messages on the powerPC list about the irq routing
and balancing changes in generic that cause the Sym2 driver to fail.

In my case, it is the tulip driver.
I have eliminated compiler, unip/smp, work loads, make -j levels;
and feel certain I have a solid 2.6.8 on this machine.
No problems with the IP network stack collapsing; produces good
executable of OpenOffice at "make -j3".

Next - binary search between 2.6.11 and 2.6.8 - find where things
went bad.  If I find anything that might also effect pa-risc, I'll post.

Note: The changes to irq routing and balancing might also be 
behind the high latency in servicing the timer interrupt that Willy
found on some pa-risc machines.

I would suggest sticking with: 'noudev nodevfs pci=routeirq'
command line options until more is known.
(They should make system work like pre-2.6.9)

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
