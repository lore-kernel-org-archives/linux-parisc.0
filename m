From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 10:50:04 -0700
Message-ID: <20051211175004.GA22449@colo.lackof.org>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<1133829923.3262.1.camel@mulgrave>
	<20051206093643.GA1706@flint.arm.linux.org.uk>
	<1133876209.3267.2.camel@mulgrave>
	<20051207122129.GA31601@isilmar.linta.de>
	<20051211065023.GA7987@colo.lackof.org>
	<1134314073.3367.5.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Russell King <rmk+pcmcia@arm.linux.org.uk>,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1134314073.3367.5.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 11, 2005 at 09:14:33AM -0600, James Bottomley wrote:
> On Sat, 2005-12-10 at 23:50 -0700, Grant Grundler wrote:
> > Could post the /proc/iomem output?
> 
> Sure, it's below

thanks

> > It just occurred to me that you shouldn't need to bring down the network.
> > We can verify if an IO range resource didn't get parented correctly or
> > otherwise failed to get registered.
> 
> Well, yes I do.  I still need to verify that the kernel works without
> the probe prevention hack.

Sorry, I wasn't clear - just referring to grabbing the /proc/iomem output.

>   The problem years ago wasn't the parenting,
> it was PCMCIA looking for things like ISA memory regions.  I know the
> card currently gets the correct parenting and regions (because it
> works).

I agree - the output for "Dino LMMIO 0" is correct.

>  The question is would it without the pcmcia hack?

*nod*.  If PCMCIA code is accessing IO Port space looking for legacy
ISA devices, then a parisc box will definitely HPMC.

Most of the parisc PCI bus controllers can only "hard fail" on a
PCI Master Abort for both IO Port and MMIO space accesses. I know
this isn't expected behavior for IO port space but HPUX didn't need
to handle this more gracefully.

I've learned that "ISA Memory regions" are 20 bits for 8-bit ISA or
24-bits for 16-bit ISA. In both cases, I would expect Host RAM to
respond instead of any IO device.  E.g. VGA memory at 0xa0000-0xb0000
would get garbage instead of an HPMC.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
