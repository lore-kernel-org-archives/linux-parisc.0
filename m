Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp8.xs4all.nl (smtp8.xs4all.nl [194.109.127.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id A16A1482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 13:03:22 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp8.xs4all.nl (8.9.3/8.9.3) with ESMTP id VAA02258
	for <parisc-linux@lists.parisc-linux.org>; Wed, 5 Sep 2001 21:03:21 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Wed, 5 Sep 2001 21:03:09 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010905210309.A9929@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010901155006.A4594@middle.of.nowhere> <20010901203232.A5963@middle.of.nowhere> <20010901201455.M5126@parcelfarce.linux.theplanet.co.uk> <20010901212835.A18546@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010901212835.A18546@middle.of.nowhere>
Subject: [parisc-linux] Re: What's a "Trace/breakpoint trap" and why does he crash my system?
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 01, 2001 at 09:28:35PM +0200, thunder7@xs4all.nl wrote:
> On Sat, Sep 01, 2001 at 08:14:55PM +0100, Matthew Wilcox wrote:
> > On Sat, Sep 01, 2001 at 08:32:32PM +0200, thunder7@xs4all.nl wrote:
> > > should be 'Trace/breakpoint trap'
> > 
> > hmm.. what version of glibc do you have installed?  something else you
> > can do is run strace -ff which will attempt to follow fork/clone/vfork.
> > 
> 2.2.3-9. 2.2.4 is out, I know.
> 
> strace -ff:
> 
<snip strace output>

one strance thing is that it will run correctly under gdb (the 5.0-4
version off the 0.9.2 iso).

Without gdb, it always prints
Trace/breakpoint trap

and no other output. The C200 then hangs, 90% of the time even the
power-switch doesn't work. I'm getting some sort of yoga-training just
trying to reach behind it for the power-cord :-)

Since I don't know how to get earlier kernels (it doesn't work in
2.4.9-pa13, it works with 2.4.0 from the 0.9.2 iso) I can't do anything
else than whine about it again. Sorry about that.

Jurriaan
-- 
HORROR FILM WISDOM:
3. Do not search the basement, especially when the power has just gone out.
GNU/Linux 2.4.9-ac7 SMP/ReiserFS 2x1402 bogomips load av: 0.34 0.22 0.16
