Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 564DF482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 May 2001 13:20:17 -0600 (MDT)
Message-Id: <200105021913.NAA12938@puffin.external.hp.com>
To: mickey@lucifier.net
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Your message of "Wed, 02 May 2001 13:23:24 EDT."
             <200105021723.f42HNOt11713@mail.lucifier.net>
Date: Wed, 02 May 2001 13:13:40 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: Diag insn
List-ID: <linux-parisc.vger.kernel.org>

Michael Shalayeff wrote:
...
> well, yes, the main goal is to have a difference on 7100lc vs 7300lc to
> use proper diag insn sequences to init tlb and other stuff,
> w/o bothering w/ pdc calls, which are sometimes not very reliable.

I can't agree with that.  I'm sure PDC on most platforms has some bugs.
But "required" (as defined by HPUX) PDC calls work.
Not using PDC in this case (BTLB init) seems silly to me since it
offers binary compatibility across platforms and archs.

See the parisc-linux.org FAQ on how to update PDC if you suspect someone
has buggy firmware. And reporting PDC bugs here could lead to them being
fixed (depends on severity and machine type) or "clean" workarounds.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
