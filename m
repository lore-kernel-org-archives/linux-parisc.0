From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Wed, 07 Dec 2005 09:01:10 -0500
Message-ID: <1133964070.3303.4.camel@mulgrave>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<1133829923.3262.1.camel@mulgrave>
	<20051206093643.GA1706@flint.arm.linux.org.uk>
	<1133876209.3267.2.camel@mulgrave>
	<20051207122129.GA31601@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Russell King <rmk+pcmcia@arm.linux.org.uk>,
 parisc-linux@lists.parisc-linux.org,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
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

On Wed, 2005-12-07 at 13:21 +0100, Dominik Brodowski wrote:
> And only if it succeeds, we read (or write) to such addresses. At least in
> theory. There seems to be a bug -- either in the PARISC setup, or in the
> PCMCIA code -- which triggers this HMAC. Let's find it, as _not_ doing these
> checks seems to be the wrong thing to do. James, could you find out what
> call exactly does this HMAC? Which kernel are you referring to? Also, maybe
> a pcibios_resource_to_bus or pcibios_bus_to_resource translation is missing
> somewhere?

Ah, well, this code has been in parisc for ages ... since I started
using my PA box as a wireless router about two years ago.  My
recollection is that it claimed to probe something in low memory as its
first printout.  Let me reverse the patch and see what happens now (I
assume the code has been updated a bit since we first had to do this).
It will take a while; I have to bring down my home network to do it and
I won't be back home until Friday.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
