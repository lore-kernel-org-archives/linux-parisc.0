Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA29566
	for <parisc-linux@puffin.external.hp.com>; Thu, 17 Feb 2000 09:25:13 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id KAA24574
	for parisc-linux@thepuffingroup.com; Thu, 17 Feb 2000 10:25:53 -0500
Date: Thu, 17 Feb 2000 10:25:52 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000217102552.D9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] field out of range
List-ID: <linux-parisc.vger.kernel.org>


The autobuild is turning up some problems like this:

gcc -I/home/pf/dkennedy/linux-2.3/include -D__KERNEL__ -I/home/pf/dkennedy/linux-2.3/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__linux__ -pipe -fno-strength-reduce   -c -o on26.o on26.c
{standard input}: Assembler messages:
{standard input}:14413: Error: Field out of range [-8184..8199] (10172).
{standard input}:14413: Error: Field out of range [-8184..8199] (10276).

Does anyone recognise this problem, and if so could they tell me what
the problem is?  This is egcs-2.91.66 according to --version.  All the
files which exhibit this problem are non-essential; this one is in paride.
There's another one in USB, iirc.
