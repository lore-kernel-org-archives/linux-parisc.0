Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA07666
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 15:36:45 -0700
Message-ID: <3A1462DB.FE4D61CA@bawue.de>
Date: Thu, 16 Nov 2000 23:42:35 +0100
From: Andreas Thienemann <andreas@bawue.de>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 250/1 doesn't boot but dumps stack
References: <200011151923.LAA13597@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> > IASQ: 00000000 00000000 IAOQ: c029c264 c029c268
> >  IIR: 0e681096    ISR: 00000000  IOR: 00000004
> > ORIG_R28: 00000000
> Smells like a driver bug.
> Can you look up IOAQ and GR2 (c029c264 and c029c248) in System.map file?
Okay, here we go (thanks for the build-tool information...)

System Map output:

0xc029c264	__init_begin+264
0xc029x248	__init_begin+248

andreas
