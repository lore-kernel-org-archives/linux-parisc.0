Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EA61482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 12:18:38 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id UAA27272
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 20:18:36 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Thu, 30 Aug 2001 20:14:05 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [newbie] gcc/glibc problems
Message-ID: <20010830201405.A2943@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010830073255.A9044@middle.of.nowhere> <20010830065907.H13438@parcelfarce.linux.theplanet.co.uk> <20010830130722.A20475@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010830130722.A20475@middle.of.nowhere>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 30, 2001 at 01:07:22PM +0200, thunder7@xs4all.nl wrote:
> On Thu, Aug 30, 2001 at 06:59:07AM +0100, Matthew Wilcox wrote:
> > 
> > do you have libc6-dev installed?
> > 
> I do now, and I can compile (Whoohoo!) but it seems to have some
> side-effects:
> 
> pa8200:/usr/bin# find
> Inconsistency detected by ld.so: dynamic-link.h: 62: elf_get_dynamic_info: Assertion `! "bad dynamic tag"' failed!

This behaviour was gone after a reboot.

On with compiling a kernel [ I still feel like I have a fabulous new
toy. May all you hppa-kernel-hackers be as merry as I am! ]

Jurriaan
-- 
D.J.'s, V.J.'s, pimps and trollops,
never mind music - this is bollocks.
	Skyclad - Penny Dreadful
GNU/Linux 2.4.9-ac2 SMP/ReiserFS 2x1402 bogomips load av: 0.45 0.12 0.04
