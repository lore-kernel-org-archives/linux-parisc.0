Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx.tellabs.fi (mx.tellabs.fi [193.65.253.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51D79482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 03:36:26 -0600 (MDT)
Received: from mxdk.dk.tellabs.com (mxdk.dk.tellabs.com [172.19.74.16])
	by mx.tellabs.fi (8.8.8/8.8.8) with ESMTP id MAA11649
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 12:36:20 +0300 (EET DST)
Received: from tellabs.com (pc-rtheande.dk.tellabs.com [172.19.63.58])
	by mxdk.dk.tellabs.com (8.8.6 (PHNE_17135)/8.8.6) with ESMTP id LAA00548
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 11:28:14 +0200 (METDST)
Message-ID: <3AE698F1.99733EE5@tellabs.com>
Date: Wed, 25 Apr 2001 11:29:21 +0200
From: Robin Theander <Robin.Theander@tellabs.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PA/Linux iso 0.6 is out!
References: <1A8904C3797ED411AC2E0008C7E6F88117C843@nlntmail2b.ats.nld.alca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Running the 32 bit STI on a 712/60 looks good. No boot problems. Nice display.
palo is giving me some trouble, so I'm not booting from HD yet.
Not all scancodes are recognized, and vi panics the kernel when hitting ESC
(this is very annoying). Some other kernel panics are probably also caused by
the keyboard.

Looking forward to running X...

Regards,
Robin.

"Witvliet, Hans" wrote:
> A quick try of the 32 bits version with STI console on a C110.
> After booting from cdrom, i get startup info and the message switching to
> STI. (looks very promissing..)
> Again some more messages and a login prompt.
> There it stops, the system does not read input from my keyboard, so can not
> login....
> 
> Will try on other systems later...
