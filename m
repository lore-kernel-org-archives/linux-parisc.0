From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sat, 10 Dec 2005 23:50:23 -0700
Message-ID: <20051211065023.GA7987@colo.lackof.org>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<1133829923.3262.1.camel@mulgrave>
	<20051206093643.GA1706@flint.arm.linux.org.uk>
	<1133876209.3267.2.camel@mulgrave>
	<20051207122129.GA31601@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: James Bottomley <James.Bottomley@SteelEye.com>,
 Russell King <rmk+pcmcia@arm.linux.org.uk>,
 linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051207122129.GA31601@isilmar.linta.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 07, 2005 at 01:21:29PM +0100, Dominik Brodowski wrote:
> Which we do not -- at least what I can see from the code.
> drivers/pcmcia/rsrc_nonstatic.c:
...
> 	-> claim_region()
> 		if (s && s->cb_dev)
> 			parent = pci_find_parent_resource(s->cb_dev, res);
> 		if (!parent || request_resource(parent, res))
> 			=> break out
> As we should.

James,
Could post the /proc/iomem output?

It just occurred to me that you shouldn't need to bring down the network.
We can verify if an IO range resource didn't get parented correctly or
otherwise failed to get registered.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
