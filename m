Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA20019
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 10:20:14 -0700
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ramdisk problem with ELF kernel 
In-reply-to: Your message of "Wed, 15 Mar 2000 03:39:09 PST."
             <20000315113909.28758.qmail@web501.mail.yahoo.com>
Date: Wed, 15 Mar 2000 09:21:34 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12VGYA-0008AB-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


= This is what I have tried:
= I found the undocumented "-r" switch in palo to add a
= ramdisk to the lif image. I tried both the original
= ramdisk.bin and the compiled ramdisk.o but in both
= cases the kernel is not able to detect the ramdisk.

PALO doesn't support ramdisks yet, which is why the option is
undocumented.  The palo boot loader (ipl) doesn't load the ramdisk even
if you used palo -r.  Our current linux kernel isn't wired to find
a boot-loaded ramdisk upon startup -- a minor modification but
one which hasn't happened.  I was avoiding that modification since
the old ramdisk scheme works with the HPUX boot loader and a palo-based
scheme won't.

Now that the hpux boot loader is useless[1] anyway, and now that everyone
is using palo, I'll look into ramdisks again.

	-Paul Bame


[1] A simple elf->som translator would be sufficient to enable the
hpux boot loader to work again.
