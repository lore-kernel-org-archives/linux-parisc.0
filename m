Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA11884
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 16:35:26 -0600
Message-ID: <3783D440.A546BAAC@ruhr-uni-bochum.de>
Date: Thu, 08 Jul 1999 00:27:12 +0200
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
MIME-Version: 1.0
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] vmlinux in C360
References: <Pine.HPX.4.05.9907071255560.20278-100000@gamgee.ntc.nokia.com>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi !

Only a little idea, but you could try to set the Boot-Offset for the loaded
Image in the
arch/parisc/Makefile from 0x10000 to 0x12000 or higher....
It could be, that we overwrite the PDC & IO-Structures from the BIOS...
I think I read something about that in the other parisc-ports.....

Helge.

Hannu Martikka schrieb:

> Hi!
>
> I have problems with Linux on C360. Here is what I tried:
>
> 1) Get latest kernel src from CVS + egcs from binaries/depot.
> 2) Compilation works fine (done on hpux11/D-series):
>         make config; make dep;make clean ; make vmlinux ; make Image
>
> 3) copy vmlinux to /stand/vmlinux in C360
> 4) reboot with IPL
> 5) hpux /stand/vmlinux
>
>         boot:(0.0......)/stand/vmlinux
>
> This is the last message. Here it hangs. On frontpanel the leds 1-3 are on
> (no 4 is off).
>
> Should it work better in C-series? or is C-series "unsupported"?
>
> - Goodi
> "The linuX Files -- The Source is Out There."
> ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

--
---------------------------------------
 Mailto:deller@gmx.de
 ICQ# 2046114
---------------------------------------
