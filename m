Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79EB04A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Feb 2001 12:50:20 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA16906
	for <parisc-linux@puffin.external.hp.com>; Sat, 3 Feb 2001 12:46:08 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3A7C60F2.C6143738@uswest.net>
Date: Sat, 03 Feb 2001 12:50:10 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] System bus walk patch
References: <3A7B1313.C6B5AFFE@uswest.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

After revewing the feedback I received from this patch, I
took the liberty to cleanup arch/parisc/kernel/inventory.c
to meet the CodingStyle requirments.  I also committed my
changes to include the System Bus Walking code into cvs
head.  If this commit causes any problems for anyone, let me
know, and I'd be glad to work through the issues with them.

Thanks,

- Ryan


Ryan Bradetich wrote:

> Hello parisc-hackers,
>
> This is the first of a series of patches to impliment an I/O tree for
> parsic-linux.  I am
> throwing this patch out to the list for discussion, and feedback before
> committing it
> to CVS because if this patch does not work, it will probably prevent
> your machine from
> booting. :)
>
> The goal of this first patch is to simply add a system bus walk to the
> end of  the firmware
> device discovery to add additional devices not reported by the
> firmware.  This patch does
> not attempt to start organizing the pa_devices into a tree strucuture,
> nor walk any other
> native bus besides the system bus.  These features will be included in
> additional patches,
> after this one has been tested and committed to CVS.
>
> I have tested this patch fairly extensively on the C200, but have not
> tried it on different
> machines. I would be interested in any feedback, concerns, questions
> anyone has about
> this patch.
>
> Thanks,
>
> - Ryan
>
>

[Patch Removed]
