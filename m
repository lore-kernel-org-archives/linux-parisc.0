Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA17495
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 05:37:49 -0700
Message-ID: <20000315113909.28758.qmail@web501.mail.yahoo.com>
Date: Wed, 15 Mar 2000 03:39:09 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ramdisk problem with ELF kernel
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I switched my build environment from HP-UX 10.20 SOM
to cross compile on x86 ELF and building and booting a
kernel works fine. Compiling the kernel now only takes
5-10 minutes compared to 1 to 1 1/2 hours(!) on my
715/33. Great ! But (there is always a but) ...

Because there is currently no network driver for the
715/33 I need to boot with a ramdisk. In former times
there was copying ramdisk.bin to /usr/src/linux and
"make Image", but how to do this now (when "make
Image" no longer works)?

This is what I have tried:
I found the undocumented "-r" switch in palo to add a
ramdisk to the lif image. I tried both the original
ramdisk.bin and the compiled ramdisk.o but in both
cases the kernel is not able to detect the ramdisk.

Has anyone a solution to this?

Ulrich

__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
