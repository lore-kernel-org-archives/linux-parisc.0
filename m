Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98F43482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 11:53:31 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id TAA15548
	for <parisc-linux@lists.parisc-linux.org>; Sun, 2 Sep 2001 19:53:30 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sun, 2 Sep 2001 19:39:55 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What's a "Trace/breakpoint trap" and why does he crash my system?
Message-ID: <20010902193955.A20014@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010901155006.A4594@middle.of.nowhere> <20010901203232.A5963@middle.of.nowhere> <20010901201455.M5126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010901201455.M5126@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 01, 2001 at 08:14:55PM +0100, Matthew Wilcox wrote:
> On Sat, Sep 01, 2001 at 08:32:32PM +0200, thunder7@xs4all.nl wrote:
> > should be 'Trace/breakpoint trap'
> 
> hmm.. what version of glibc do you have installed?  something else you
> can do is run strace -ff which will attempt to follow fork/clone/vfork.
> 
As answered before, 2.2.3-9.

Since this seems to happen with 2.4.9-pa13 and not with 2.4.0 from the
0.9.2 ISO, perhaps I ought to do some checking when exactly it broke.

Can anybody point me to a quick cvs reference, starting with

cd [somewhere]
tar zxvf linux-latest.tar.gz

and then? I'm only interested in extracting certain
kernel-versions (by date?).

Thanks,
Jurriaan
-- 
proof by cumbersome notation:
	Best done with access to at least four alphabets and special
	symbols.
GNU/Linux 2.4.9-ac5 SMP/ReiserFS 2x1402 bogomips load av: 1.34 0.71 0.31
