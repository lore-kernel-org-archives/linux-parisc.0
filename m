Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.xs4all.nl (smtp3.xs4all.nl [194.109.127.132])
	by dsl2.external.hp.com (Postfix) with ESMTP id E6BC1482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Sep 2001 08:29:51 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp3.xs4all.nl (8.9.3/8.9.3) with ESMTP id QAA09443
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Sep 2001 16:29:22 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sun, 16 Sep 2001 16:28:41 +0200
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Trace/Breakpoint trap on "make mrproper"
Message-ID: <20010916162841.A6914@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <200109071356.HAA22153@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109071356.HAA22153@udlkern.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 07, 2001 at 07:56:42AM -0600, John Marvin wrote:
> >
> > It looks like this patch:
> > >Date: Thu, 6 Sep 2001 03:48:16 -0600 (MDT)
> > >From: John Marvin jsm@udlkern.fc.hp.com
> > >Subject: [parisc-linux-cvs] Patch for SMP support, etc.>
> > >A rather large patch that includes my current SMP support changes, plus
> > >a variety of other fixes/changes.
> >
> > did something. But it's so large I'm not sure what exactly :-)
> >
> > Jurriaan
> >
> 
> I was pretty sure my changes to handle_break (in traps.c) would fix that
> problem.  When I read your note I remembered that I had seen a similar
> problem and fixed it.  The kernel would hang when a user program executed
> a break instruction (either intentionally or not) without an attached
> debugger. That is the problem you were seeing.
> 
> However, now that the machine doesn't hang, I am not sure if the remaining
> problem you are seeing is a kernel bug or a userland bug.  It would appear
> that you are executing 0's (0x00000000 is a break instruction). That
> should cause the kernel to send you a SIGTRAP signal. I just checked some
> of your old mail, and it looks like you are getting a SIGTRAP. One thing
> that looks strange is that you are getting signals delivered using stack
> addresses both at ~0xfaf00000 and ~0xbff00000. I wonder if make is using
> an alternate signal stack?
> 
It may interest you to know that this 'Trace/breakpoint trap' does occur
when I compile the kernel for a PA8x00 cpu, but it doesn't occur when I
compile for PA7x00 cpu....

Jurriaan
-- 
I'll never be back and I'll never be missed
But I leave something here
And that doesn't seem right
	Big Country - The Dynamite Lady
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.00 0.09 0.06
