Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA05416
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 19:22:55 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (Postfix) with ESMTP id 59593321
	for <parisc-linux@thepuffingroup.com>; Tue,  8 Feb 2000 17:18:40 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id RAA12256 for <parisc-linux@thepuffingroup.com>; Tue, 8 Feb 2000 17:19:35 -0800 (PST)
Message-Id: <200002090119.RAA12256@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] files still needing manual merging 
In-reply-to: Your message of "Tue, 08 Feb 2000 17:08:07 PST."
             <200002090108.RAA12200@milano.cup.hp.com>
Date: Tue, 08 Feb 2000 17:19:35 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Thomas Bogendoerfer wrote:
...
> where I get unresolved symbols:

I didn't even get that far in my build:

make[2]: Entering directory `/linux/grundler/linux-2.3/ipc'
gcc -I/linux/grundler/linux-2.3/include -D__KERNEL__ -I/linux/grundler/linux-2.3/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__linux__ -pipe -fno-strength-reduce   -c -o util.o util.c
In file included from util.c:17:
/linux/grundler/linux-2.3/include/linux/msg.h:32: asm/msgbuf.h: No such file or directory
make[2]: *** [util.o] Error 1
make[2]: Leaving directory `/linux/grundler/linux-2.3/ipc'



I'll work on the pcibios_enable_device() code now.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
