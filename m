Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA29317
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 14:01:24 -0700
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: "Steve Moret" <smoret@uci.edu>
Subject: Re: [parisc-linux] HP 9000/735-125
Date: Thu, 30 Nov 2000 21:22:53 +0100
Cc: parisc-linux@thepuffingroup.com
References: <FKEGLIIBOIACJOCCAFIMIEFGCCAA.smoret@uci.edu> <00113019374604.00309@P100>
In-Reply-To: <00113019374604.00309@P100>
MIME-Version: 1.0
Message-Id: <00113021225305.00309@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 30 November 2000 19:37, Helge Deller wrote:
> On Thursday 30 November 2000 18:50, Steve Moret wrote:
> > With the BiDirectional stuff back in it dies here:
> >
> > Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
> > POSIX conformance testing by UNIFIX
> > ASP version 20 at 0xf0800000 found.
> > LED (ASP-style) display at f0800020
> > parport_gsc.c: initialize bidirectional-mode
>
> [oops msg deleted]
>
> Yup, that was what I thought !
> I will try to come up with a clean fix in the next few hours...

I've just committed a fix which should work on both (ASP & LASI)...
Would you mind to test this stuff again ?

Thanks,

	Helge.
