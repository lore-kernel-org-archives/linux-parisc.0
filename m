Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8068482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Jul 2001 17:32:27 -0600 (MDT)
Message-Id: <200107082331.RAA09058@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.6-pa5 crashes on B160L 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sun, 08 Jul 2001 22:10:12 BST." <20010708221012.N6103@parcelfarce.linux.theplanet.co.uk>
Date: Sun, 08 Jul 2001 17:31:25 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> The stack dump isn't really necessary ... Does anyone else think we
> should turn it off by default?
...

No. I don't think we should turn it off.
Not until we can get memory core dumps on crashes like HPUX does.

> It'd also be helpful to show where the kernel got to before it did the
> stack dump -- might help track it down.

Isn't that what the stack dump is for?

If one is really good (like jsm) and has a matching vmlinux and System.map,
one can backtrace the stack by hand by looking at stack frame (return pointer
is in the stack frame) and seeing how much each subroutine grows the stack
(look at code around subroutine call, iirc). I think the mail archives
have a concise desription of exactly how to use the stack dump.
But I am too lazy to look for it now.

If one is lazy and not quite so good (like me), then look at build-tools/astk
script. astk can sift through the stackdump for kernel symbols to produce
something almost sortof like a stack trace with some extra garbage in it.

> > What else is needed to debug this? Is there a ksymoops equivalent?
> > I can supply .config, System.map on request.
> 
> I tend to look it up by hand -- 102a4990 is the most interesting address,
> (IAOQ) and r2 is sometimes also interesting (not in this case, it
> would seem).

I use build-tools/a.c (compiled of course) to lookup symbols in a System.map.

The only other thing needed to debug the problem is for someone to unwind
the stack, see how it got where it was and then stare at the code until it's
clear why it crashed.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
