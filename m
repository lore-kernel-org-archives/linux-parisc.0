Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA09272
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 04:05:17 -0600
Received: from stybba.ntc.nokia.com (stybba.ntc.nokia.com [131.228.178.21]) by ns10.nokia.com (8.8.8/8.6.9) with ESMTP id NAA23776 for <parisc-linux@thepuffingroup.com>; Wed, 7 Jul 1999 13:05:36 +0300 (EET DST)
Received: from gamgee.ntc.nokia.com (martikka@gamgee [131.228.178.130])
	by stybba.ntc.nokia.com (8.9.1a/8.9.1/Goodi) with ESMTP id NAA00484
	for <parisc-linux@thepuffingroup.com>; Wed, 7 Jul 1999 13:05:35 +0300 (EET DST)
Date: Wed, 7 Jul 1999 13:05:35 +0300 (EETDST)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <3782F26C.78876DDD@thepuffingroup.com>
Message-ID: <Pine.HPX.4.05.9907071255560.20278-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Subject: [parisc-linux] vmlinux in C360
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I have problems with Linux on C360. Here is what I tried:

1) Get latest kernel src from CVS + egcs from binaries/depot.
2) Compilation works fine (done on hpux11/D-series):
	make config; make dep;make clean ; make vmlinux ; make Image

3) copy vmlinux to /stand/vmlinux in C360
4) reboot with IPL
5) hpux /stand/vmlinux

	boot:(0.0......)/stand/vmlinux

This is the last message. Here it hangs. On frontpanel the leds 1-3 are on
(no 4 is off).

Should it work better in C-series? or is C-series "unsupported"?

- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
