Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA31168
	for <parisc-linux@puffin.external.hp.com>; Fri, 12 Nov 1999 12:48:41 -0700
Date: Fri, 12 Nov 1999 20:51:25 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: bkatz@agilent.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ASP
Message-Id: <19991112205125.A10038@mathe.stud.uni-erlangen.de>
References: <199911101524.HAA02309@meow.sr.hp.com> <19991111022331.W25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991111022331.W25252@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> which seems pretty comprehensive.  I'm wondering about slimming down our
> interrupt architecture for older machines; it's a trifle over-engineered
> for a machine which can't be expanded.

it is ?  Of course, you could hardcode the interrupt handlers in the ASP
main interrupt handler, so you would do

switch(ffs(mask)) {
case 0:
	return;
case 1:
	asp_something_interrupt();
	break;
case 2:
	asp_something_else_interrupt();
	break;
case 3:
	asp_keyboard_interrupt();
	break;
}

but my guess is this would just result in a jump table of function calls
rather than an indirect call - not going to improve performance measurably.

	Philipp Rumpf
