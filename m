Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EC784A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Mar 2001 19:25:47 -0700 (MST)
Message-Id: <200103070228.SAA04517@milano.cup.hp.com>
To: Mattias Wadenstein <maswan@acc.umu.se>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] TODO-list entry about floating point completion and trap handler 
In-reply-to: Your message of "Wed, 07 Mar 2001 01:12:11 PST."
             <Pine.GSO.4.33.0103070106100.18362-100000@tiger.acc.umu.se>
Date: Tue, 06 Mar 2001 18:28:56 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Mattias Wadenstein wrote:
> I'm still migrating the outdated todo list into the BTS.

yes - and doing a respectable job of it too! :^)

> I found these two:
>      * Finish floating point completion and trap handler. (Volunteer?)
>      * Verify floating point trap behaviour is correct (Volunteer?)

I think the reason was not all FP coprocessors implement all
FP instructions in silicon. Some of the insn's defined by the
arch need to be implemented in FP emulation.

Anyone know real details?
Or where to look for them?

| And it seems that it is unclear if they need to be done. If anyone knows
| that they need to be done, please submit a bug regarding that to the bug
| tracking system.

We currently enable the FPU if PDC tells us the CPU has one.
All the CPUs we support have one (712/80i might be an exception).
So it also depends on what type of code gcc generates or what
kind of hand written asm people write for special applications.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
