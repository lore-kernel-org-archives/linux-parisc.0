Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12472
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 11:05:55 -0600
Received: from hpisp747.cup.hp.com (hpisp747.cup.hp.com [15.8.81.247])
	by onet2.cup.hp.com (Postfix) with ESMTP id 16BF3A72
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Sep 2000 10:06:34 -0700 (PDT)
Received: from grundler by hpisp747.cup.hp.com with local (Exim 3.12 #1 (Debian))
	id 13cW3m-0006sn-00
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Sep 2000 09:52:26 -0700
To: parisc-linux@thepuffingroup.com
Message-Id: <E13cW3m-0006sn-00@hpisp747.cup.hp.com>
From: Grant Grundler <grundler@cup.hp.com>
Date: Fri, 22 Sep 2000 09:52:26 -0700
Subject: [parisc-linux] internal error in tc-hppa.c?
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I crashed the assembler with the following output:

make[1]: Entering directory `/linux/kwdb64/linux-2.3/arch/parisc64/kernel'
hppa64-linux-gcc -I/linux/kwdb64/linux-2.3/include   -D__KERNEL__ -I/linux/kwdb64/linux-2.3/include  -c -o entry.o entry.S
entry.S: Assembler messages:
entry.S:1: Internal error, aborting at /linux/pa32/binutils-2.10/gas/config/tc-hppa.c line 4017 in tc_gen_reloc
Please report this bug.
make[1]: *** [entry.o] Error 1
make[1]: Leaving directory `/linux/kwdb64/linux-2.3/arch/parisc64/kernel'


I was told entry.S is broken but the assembler should handle it
more gracefully...so I'll be looking at entry.S to see what's broken.

Line number of entry.S is junk since parisc64 version is just
an include of the parisc version. line 1560 is the real culprit:
        b,n .

Trying to figure out what the problem is now...

grant
