Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA10423
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Feb 2000 06:42:53 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12IVr5-0027lfC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Wed, 9 Feb 2000 13:04:23 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Wed, 9 Feb 2000 13:04:18 +0100
From: Thomas Bogendoerfer <tsbogend@hub-fue.franken.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] files still needing manual merging
Message-ID: <20000209130418.A2446@hub-fue.franken.de>
Reply-To: tsbogend@alpha.franken.de
References: <200002090108.RAA12200@milano.cup.hp.com> <200002090119.RAA12256@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002090119.RAA12256@milano.cup.hp.com>; from Grant Grundler on Tue, Feb 08, 2000 at 05:19:35PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 08, 2000 at 05:19:35PM -0800, Grant Grundler wrote:
> I didn't even get that far in my build:
> 
> make[2]: Entering directory `/linux/grundler/linux-2.3/ipc'
> gcc -I/linux/grundler/linux-2.3/include -D__KERNEL__ -I/linux/grundler/linux-2.3/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__linux__ -pipe -fno-strength-reduce   -c -o util.o util.c
> In file included from util.c:17:
> /linux/grundler/linux-2.3/include/linux/msg.h:32: asm/msgbuf.h: No such file or directory

that's a new file, I forgot to check it in. I'll do that, when I get home.
A quick fix for this would be to copy asm-sparc/msgbuf.h to asm-parisc.

Thomas.
