Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id LAA32384
	for <hppa-linux@sod.res.cmu.edu>; Tue, 23 Mar 1999 11:28:14 -0500
Received: from the-village.bc.nu (lightning.swansea.uk.linux.org [194.168.151.1]) by snowcrash.cymru.net (8.8.7/8.7.1) with SMTP id QAA02773 for <hppa-linux@thepuffingroup.com>; Tue, 23 Mar 1999 16:28:03 GMT
Message-Id: <m10PUsJ-0007U2C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [hppa-linux] GCC and static branch prediction
To: hppa-linux@thepuffingroup.com
Date: Tue, 23 Mar 1999 17:21:57 +0000 (GMT)
In-Reply-To: <199903231612.LAA02124@caliban.physics.utoronto.ca> from "Christopher Neufeld" at Mar 23, 99 11:12:33 am
Content-Type: text
List-ID: <linux-parisc.vger.kernel.org>

>    A few of us were discussing recently a way to take advantage of static
> branch prediction in the PA-RISC architecture. The problem is that there
> is no ANSI C construct for specifying whether a branch is likely taken,
> or likely not taken.

We already sort of do this for the dynamic branch predictions. The gcc
code generator writes faster code for one path of an if/else in general
anyway. So you just get the pa-risc back end to output the right assumptions.

I'd start by walking though
