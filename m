Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA17738
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 11:43:10 -0700
Message-Id: <200012061846.KAA06115@milano.cup.hp.com>
To: Thomas Marteaut <marteaut@esiee.fr>
Cc: Puffin Group <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Sorry 
In-reply-to: Your message of "Wed, 06 Dec 2000 11:05:31 PST."
             <3A2E0F6B.F03B2BA@esiee.fr>
Date: Wed, 06 Dec 2000 10:46:00 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Marteaut wrote:
> Hi all,
> 
> 	I am sorry for the last message.

np. You followed up with an explanation in english.

> Helge, you can notice that now, on our 712, led DISPLAY is at
> 0x00000000! 

Could be a hint the 712 has no external LED's?


> And the RTC does print Cannot access the Hardware Clock via any method
> on both machines!

"RTC" here is hwclock program.
Is CONFIG_GENRTC enabled?
It is by default for 32-bit kernels but not yet for 64-bit.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
