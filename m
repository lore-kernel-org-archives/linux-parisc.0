Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA16264
	for <parisc-linux@puffin.external.hp.com>; Fri, 28 Apr 2000 14:29:56 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel1.hp.com (Postfix) with ESMTP id 6E7051CA08
	for <parisc-linux@thepuffingroup.com>; Fri, 28 Apr 2000 16:29:51 -0400 (EDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id A0E294FD8D
	for <parisc-linux@thepuffingroup.com>; Fri, 28 Apr 2000 16:29:50 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id NAA09211 for parisc-linux@thepuffingroup.com; Fri, 28 Apr 2000 13:30:09 -0700 (PDT)
Date: Fri, 28 Apr 2000 13:30:09 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200004282030.NAA09211@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] crt0.S does not build
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I'm trying to get builds working on a new x86 box.
I've built/installed binutils and gcc (--prefix=/opt/puffin).
I'm able to build linux-2.3 kernels but palo dies with:
make[1]: Leaving directory `/linux/grundler/palo/palo'
cd ipl && make
make[1]: Entering directory `/linux/grundler/palo/ipl'
hppa1.1-linux-gcc -D__ASSEMBLY__  -traditional -c -o crt0.o crt0.S
crt0.S: Assembler messages:
crt0.S:4: Error: Unknown opcode: `execution'
crt0.S:6: Error: Unknown opcode: `we'
crt0.S:8: Fatal error: Unknown opcode: `$start$(interactive, endaddr)'
make[1]: *** [crt0.o] Error 1
make[1]: Leaving directory `/linux/grundler/palo/ipl'
make: *** [makeipl] Error 2

It seems the assembler is not interpreting the ';' as comments.
Is the crt0.S broken or my assembler?

thanks,
grant

ps. paul: my source is on hpisp747:/linux/grundler . I updated/copied
   the CVS sources over from my existing HP-UX build machine.
