Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71A1848AA
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 02:32:08 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id EAA09640
	for <parisc-linux@lists.parisc-linux.org>; Mon, 1 Oct 2001 04:31:52 -0400
Message-Id: <200110010831.EAA09640@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Cumulative patch for 720 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 01 Oct 2001 04:31:52 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

> I've fiddled with your patch some more and I'm still having problems
> applying it to 2.4.9-pa27:
> 
> patching file linux/arch/parisc/kernel/traps.c
> Hunk #1 succeeded at 46 with fuzz 2.
> Hunk #2 FAILED at 277.
> Hunk #3 FAILED at 331.
> Hunk #4 FAILED at 375.
> Hunk #5 FAILED at 445.
> 4 out of 5 hunks FAILED -- saving rejects to file linux/arch/parisc/kernel/traps.c.rej
> 
> Could you perhaps put it on HTTP somewhere?
> 
> Regards,
> 
> Albert

Hi Albert and others!

I've just tested and it applies cleanly to the latest CVS source
(dated September 30th). Anyway, I found out, that I forgot to
change mm/fault.c in the original patch, so maybe it's good,
that You didn't apply it :-). The new version is at

http://www.theophys.kth.se/~jurijus/patches/720.patch

If someone applied the old version and could not get the kernel to 
compile (it complains about parisc_acctyp) just change 

static unsigned long
parisc_acctyp(unsigned long code, unsigned int inst)

to 

unsigned long
parisc_acctyp(unsigned long code, unsigned int inst)

in

arch/parisc/mm/fault.c

New version takes care of this automatically.

Best regards,

Jurij





---------------------------------------------------------
Get Free Private Encrypted Email https://mail.lokmail.net
        Switch to Name.Space: http://namespace.org/switch
