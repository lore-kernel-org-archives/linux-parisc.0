Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA02508
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 12:55:32 -0700
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-Reply-To: Your message of "Tue, 02 Jan 2001 14:39:03 EST."
             <200101021939.OAA07752@hiauly1.hia.nrc.ca>
References: <200101021939.OAA07752@hiauly1.hia.nrc.ca> 
Date: Tue, 02 Jan 2001 12:58:50 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14DXa6-0005xq-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= Last time I looked the 64 bit port was still using the same milli
= library as the 32 bit port.

Yes -- leading to some very surprising 64-bit kernel failures
before I found this "feature".  This is a 64-bit parisc linux gcc bug.

= Thus to integrate a 64 bit library,
= some work would have to be done to the machine description.  There
= are hooks to build asm code (see for example lib1funcs.asm and
= lib2funcs.asm in config/pa).

I've played with this a bit before -- I did the first ELF version of
of 32-bit millicode.  But I'm not at all certain we want to
keep millicode in libgcc.a since there's also some parisc linker magic to
automatically link millicode when required -- because some makefiles
using ld -r break (like the Linux kernel build) unless they're hacked to
include an explicit reference to libgcc.a.

= Has HP contributed this code to the public domain?  Probably, Jeff
= Law would be the one to contact to get integrated into the gcc mainline.

I have permission to sanitize and (L?)GPLize it.  I'm planning to
attempt the basic integration and then let Jeff or someone tell me
how I screwed it up :-)

	-Paul Bame
