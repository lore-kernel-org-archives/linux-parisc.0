Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA10136
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 16:46:48 -0700
Date: Sun, 14 Nov 1999 19:59:11 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Ryan Bradetich <rbradetich@uswest.net>
cc: paul_bame@hp.com, Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
In-Reply-To: <382F3C94.BFF3EB9D@uswest.net>
Message-ID: <Pine.LNX.4.10.9911141954080.7120-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Sun, 14 Nov 1999, Ryan Bradetich wrote:
> I have started working on getting the kernel to boot on the PA2.0
> architecture again, and I see the you and others have been doing
> lots of work with the initialization code.  (Nice job to everyone btw,
> the code is a lot easier to figure out for a newbie like me! :)

Same here.

> I am working on a C200+ which has the PA2.0 processor, so in the
> the following section of code it should give me an error during the
> BTLB initialization, but during the PDC_BTLB_INSERT pret is set
> to 0, so the check for non-PA1.1 architecture's fail.

It's a bit unclear to me which processor is actually in there, but I
believe it's an 8000, so it and the firmware may in fact support
PDC_BTLB_INSERT, which means that the kernel might work properly.

I have a C3000 which does *NOT* implement PDC_BTLB functions.

It sounds like the error message is actually a bit misleading.

Instead of:

         mprintf("Looks like there's no BTLB on this box, so it's > probably\n"
                       "either PA1.0 or PA2.0.  In any case we're screwed for now\n");

it should be:

"Looks like there's no BTLB on this box, so it's either a PA1.0 or a PA2.0
that doesn't implement BTLBs"

How far does it actually boot though?

- Alex
