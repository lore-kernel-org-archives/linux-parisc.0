Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA05733
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Nov 1999 12:25:48 -0700
Date: Sat, 13 Nov 1999 20:28:36 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 useful
Message-Id: <19991113202836.B29929@mathe.stud.uni-erlangen.de>
References: <19991113192150.X25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991113192150.X25252@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> For the machines which have ASP, am I right in saying they have no other
> sources of interrupts?  ie what I want to do is:
> 
> if we detect an ASP, set the interrupt routine to load the IRR from ASP
> and then only make one pass through do_irq_mask instead of two.
> 
> This lets me not bother which irq line ASP is interrupting on, at the
> expense of not being able to take interrupts from any other source.
> And it'll reduce interrupt latency on those older machines with ASP,
> so it seems like a win, unless I'm wrong and it's possible to add other
> sources of interrupt to them.

Matthew,  I think you are overestimating the negative impact this code has on
interrupt latency.  Furthermore, I do not believe solving a problem that is a
limitation of the interface used - our current driver table device management
system does not allow offsetting IRQ numbers in the same way a linked list
would (and does, for PCI).

The very same problem you want to avoid has to be solved in a clean way for Lasi,
and handling it different on otherwise very similar machines (712, 715) does
more to confuse developers and users (for whom we cannot totally avoid contact
with virtual IRQ numbers) than it does to improve the actual performance of the
kernel.

If you should disagree on the order of performance loss we are talking about here,
please provide benchmarks - should the delay turn out to be unacceptable, we need
to find a way of lowering it, even if it does mean to obfuscate code.


	Philipp Rumpf
