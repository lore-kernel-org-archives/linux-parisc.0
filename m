Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from koza.acecape.com (ns1.acecape.com [160.79.54.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1E7D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 May 2001 13:30:24 -0600 (MDT)
From: Michael Shalayeff <mickey@mail.lucifier.net>
Message-Id: <200105021930.f42JUGd08376@mail.lucifier.net>
In-Reply-To: <200105021913.NAA12938@puffin.external.hp.com> from Grant Grundler
 at "May 2, 2001 01:13:40 pm"
To: Grant Grundler <grundler@puffin.external.hp.com>
Date: Wed, 2 May 2001 15:30:16 -0400 (EDT)
Cc: mickey@lucifier.net, parisc-linux@lists.parisc-linux.org
Reply-To: mickey@lucifier.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Diag insn
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Grant Grundler:
> Michael Shalayeff wrote:
> ...
> > well, yes, the main goal is to have a difference on 7100lc vs 7300lc to
> > use proper diag insn sequences to init tlb and other stuff,
> > w/o bothering w/ pdc calls, which are sometimes not very reliable.
> 
> I can't agree with that.  I'm sure PDC on most platforms has some bugs.
> But "required" (as defined by HPUX) PDC calls work.
> Not using PDC in this case (BTLB init) seems silly to me since it
> offers binary compatibility across platforms and archs.

there are many ways on achieving binary compatibility,
one of which will be a pointer to function.
this does not dismiss the initial question of course,
how to detect 7100lc vs 7300lc besides cache size
and machine model number, if ther is no way to do so,
then there is no way to do so.

> See the parisc-linux.org FAQ on how to update PDC if you suspect someone
> has buggy firmware. And reporting PDC bugs here could lead to them being
> fixed (depends on severity and machine type) or "clean" workarounds.

again, between two choices of system boots and it does not boot
until pdc bugs get fixed or otherwise problems resolved it
seems the first one wins.

let's say hypothetically.

cu

-- 
    paranoic mickey       (my employers have changed but, the name has remained)
