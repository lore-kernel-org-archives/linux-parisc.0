Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA06038
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 15:00:16 -0700
Received: from gate.ixs.bb.bawue.de (p3E9D2999.dip.t-dialin.net [62.157.41.153])
	by bender.bawue.de (Postfix) with ESMTP id 2F26080C
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 23:02:17 +0100 (CET)
Received: from bawue.de (ixs.ixs.com [192.168.1.2])
	by gate.ixs.bb.bawue.de (8.9.3/8.9.3) with ESMTP id XAA31904
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 23:02:15 +0100
Message-ID: <3A145A4C.BFF3D5D8@bawue.de>
Date: Thu, 16 Nov 2000 23:06:04 +0100
From: Andreas Thienemann <andreas@bawue.de>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 250/1 doesn't boot but dumps stack
References: <200011151923.LAA13597@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Grant,

Grant Grundler wrote:

> > lp0: using parport0 (interrupt-driven).
> Are you sure you left out parallel port support?
Yes, I am. I just attached the wrong log. Except the lp0 line, there are no
differences...

> > IASQ: 00000000 00000000 IAOQ: c029c264 c029c268
> >  IIR: 0e681096    ISR: 00000000  IOR: 00000004
> > ORIG_R28: 00000000
> Smells like a driver bug.
> Can you look up IOAQ and GR2 (c029c264 and c029c248) in System.map file?
Of course.
The only problem is, there is no such entry in
/usr/src/pa-risc/sourcE/linux/System.map .

Any ideas?

 andreas
