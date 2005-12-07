From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Wed, 7 Dec 2005 13:21:29 +0100
Message-ID: <20051207122129.GA31601@isilmar.linta.de>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<1133829923.3262.1.camel@mulgrave>
	<20051206093643.GA1706@flint.arm.linux.org.uk>
	<1133876209.3267.2.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Russell King <rmk+pcmcia@arm.linux.org.uk>,
 parisc-linux@lists.parisc-linux.org,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1133876209.3267.2.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

On Tue, Dec 06, 2005 at 08:36:48AM -0500, James Bottomley wrote:
> On Tue, 2005-12-06 at 09:36 +0000, Russell King wrote:
> > I don't think you've fully understood what I've been saying.
> > When we try to do memory probing, we setup a mapping in the same
> > way that we setup a mapping to read the CIS from the card.
> 
> Yes, I do.  On PARISC, memory I/O ranges are directed.  If you program
> the CIS to respond outside the directed range of its parent,

Which we do not -- at least what I can see from the code.
drivers/pcmcia/rsrc_nonstatic.c:
	-> pcmcia_nonstatic_validate_mem()
	-> validate_mem()
	-> do_mem_probe()
	-> cis_readable()
	-> claim_region()
		if (s && s->cb_dev)
			parent = pci_find_parent_resource(s->cb_dev, res);
		if (!parent || request_resource(parent, res))
			=> break out
As we should.

And only if it succeeds, we read (or write) to such addresses. At least in
theory. There seems to be a bug -- either in the PARISC setup, or in the
PCMCIA code -- which triggers this HMAC. Let's find it, as _not_ doing these
checks seems to be the wrong thing to do. James, could you find out what
call exactly does this HMAC? Which kernel are you referring to? Also, maybe
a pcibios_resource_to_bus or pcibios_bus_to_resource translation is missing
somewhere?

Thanks,
	Dominik
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
