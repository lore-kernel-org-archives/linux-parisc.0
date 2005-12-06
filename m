From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Tue, 6 Dec 2005 01:14:58 -0700
Message-ID: <20051206081458.GA16793@colo.lackof.org>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: James Bottomley <James.Bottomley@SteelEye.com>,
 Kyle McMartin <kyle@parisc-linux.org>,
 linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051205220344.GJ15201@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 05, 2005 at 10:03:44PM +0000, Russell King wrote:
..
> I don't have issue with the I/O side.  It's the memory side I'm
> wondering about.
> 
> The probing code sets up a mapping to place the CIS at one of the
> regions,

How is the region selected? (ie please point me at the right code)

Is there some obvious document that explains my basic questions?
I'm happy to read to learn a bit more.  My ob600ct is still
here waiting for me to fix PCMCIA on it...*sigh*


If using IO port space, parisc can be very flexible as each PCI bus
essentially has it's own IO port space range.

But with MMIO space, routing is typically setup by firmware.
Each PCI bus controller will get one(*) region of MMIO space
routed to it by the chipset. Children of that PCI bus must use
MMIO addresses allocated from that region.

(*) I'm simplifying a bit here. The full explanation is more complex.
   But treating it like one region is sufficient in practice
   and for the purpose of this discussion.

>  and then tries to validate/read the CIS.  It then unmaps
> it and maps it into the next place and repeats.  Hence, we're
> reading data from the PCMCIA card after setting up various valid
> mappings.

Ok. More basic questions:
Why are we doing this? Is this a form of bus walk?

> These mappings are not much different from the mappings which are
> used to interpret the CIS data from the card after the memory
> probing has completed.

I'm not familiar with how CIS data is read from a PCMCIA device.
Normal PCI uses "Config Space". Is PCMCIA using MMIO space
for both CIS/device discovery and assigning MMIO space to
PCMCIA device registers?

> Hence, if the memory probing is causing you issues, I'd be concerned
> about the reliability of reading the CIS data from the card under
> the non-probing scenarios.

If PCMCIA is susceptible to write posting issues, then a
PCI-PCMCIA bridge on PARISC is likely to expose those issues.
ie timing of register writes are likely different.


> Alternatively, maybe you've found a real bug somewhere in PCMCIA
> which needs fixing...

That's possible. If PCMCIA is assigning MMIO addresses outside the
range routed down the PCI bus, the box will HPMC. The "PIM dump"
(CPU state when it HPMC'd) can tell which address the CPU failed
to access. So we should be able to determine if this is the case
or not pretty easily.

I don't have any PCI-PCMCIA adapters...so may have to wait until
james is home again and has an hour to poke at this again.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
