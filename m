Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA03646
	for <parisc-linux@puffin.external.hp.com>; Wed, 21 Jul 1999 06:15:24 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: "Paul J.Y.Lahaie" <pjlahaie@ottawa.com>, Philipp Rumpf <prumpf@suse.de>
Subject: Re: [parisc-linux-cvs] pjlahaie, interrupted with code 28....
Date: Wed, 21 Jul 1999 13:30:51 +0200
Content-Type: text/plain
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Message-Id: <99072113442100.07620@P100>
List-ID: <linux-parisc.vger.kernel.org>

Hi Paul, 
Hi Philipp !

Sorry for my last mail, but I found some more background-info for my
last mail:

I think it´s something wrong in the interrupt-routine (but I´m really not sure
about that !!), since when I don´t use DINO/PCI-support the kernel freezes too.
Info:
I added a stopkernel_with_rolling_leds()-call (endless-loop in setup.c)
directly behind the "POSIX"-text in main.c. This means, that the kernel should
loop forever in this routine. But the kernel freezes after some time,
at other boot-ups I get endless messages "Interrupted with code 9" after some time 
behind the output of "POSIX...". Could it be, that the stack
overflows after some time (maybe because of interrupts in the background, which
does not restore the stack correctly (Philipp??)) ?

Maybe also my kernel-origin-change in the Makefile to 0x10000 (we used
0x12000 before) could be the reason ? I don´t know yet...

Comments ?

Helge.
