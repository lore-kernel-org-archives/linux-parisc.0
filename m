Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2723B4868
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 17:50:35 -0700 (MST)
Date: Mon, 19 Jan 2004 17:50:33 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
Message-ID: <20040120005033.GA3846@colo.lackof.org>
References: <200401182059.34270.deller@gmx.de>
	<1074522943.2201.1.camel@mulgrave>
	<200401192248.29566.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401192248.29566.deller@gmx.de>
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 19, 2004 at 10:48:29PM +0100, Helge Deller wrote:
> > Sorry, I'm an idiot...these type of cards don't seem to work (they seem
> > to require ISA IRQ routing rules, which we can't provide).
> 
> Wouldn't it be possible to write a wrapper, which simulated the
> ISA IRQs 0-15 and routes them to dino instead ?

Yes

> Isn't this similiar like the hack we have for the EISA driver ?
> And maybe we are lucky and no PA-machine has both, EISA and PCMCIA.
> Would this be possible ?

Certainly. Need to write the "glue" that aliases the ESIA IRQs
(IRQ region 0) to which ever Dino IRQ region is handling them.
In other words, convert the PCI interrupts to ISA interrupts.
If you could fake the ISA driver into using PCI interrupts
(ie IRQs > 15), then one could register device driver interrupt
handler directly with Dino. Otherwise, an intermediate interrupt
handler will be needed that translates the Dino interrupt
into whatever IRQ the PCMCIA/ISA device thinks it's using.

I don't konw any of the details, that's just the overview.
In particular, how to determine which Dino is the right one.
On RDI PrecisionBook laptop, it might be simple and maybe just
make some assumptions based on that implementation.

grant
