Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA30899
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 20:40:54 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 4466E92E
	for <parisc-linux@thepuffingroup.com>; Wed, 24 Jan 2001 19:44:38 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id TAA21555
	for parisc-linux@thepuffingroup.com; Wed, 24 Jan 2001 19:46:40 -0800 (PST)
Date: Wed, 24 Jan 2001 19:46:40 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200101250346.TAA21555@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.4.0 merge mangle our tree?
List-ID: <linux-parisc.vger.kernel.org>

Hi Matthew,

I did 'cvs co -D "1/24/2001 09:00 MST" linux' in order to pick
up the bits before the 2.4.0 "First take" commit.

	make distclean
	make oldconfig
	edit .config to set CONFIG_SMP=y
	make oldconfig
	make -j4 dep
	make -j4 palo  (dies with error)

"make palo" dies with:

hppa-linux-gcc -D__KERNEL__ -I/linux/smp64/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mschedule=7200 -mdisable-fpregs -fno-strict-aliasing -ffunction-sections    -c -o tcp_minisocks.o tcp_minisocks.c
tcp_minisocks.c: In function `tcp_timewait_state_process':
tcp_minisocks.c:137: too many arguments to function `tcp_parse_options'
tcp_minisocks.c: In function `tcp_check_req':
tcp_minisocks.c:812: too many arguments to function `tcp_parse_options'
make[3]: *** [tcp_minisocks.o] Error 1
make[3]: Leaving directory `/linux/smp64/linux/net/ipv4'
...


grundler <725>fgrep tcp_minisocks net/ipv4/CVS/Entries 
/tcp_minisocks.c/1.1.1.2/Tue Jan  9 16:56:41 2001/-ko/D2001.01.24.07.00.00

And from the cvs log output:
head: 1.2
...
symbolic names:
	LINUS_240_FIXUP: 1.1.0.2
	LINUS_240_PREMERGE: 1.1
	LINUS_240: 1.1.1.2
	LINUX_240_PREIMPORT: 1.1
...
----------------------------
revision 1.2
date: 2001/01/25 00:03:54;  author: willy;  state: Exp;  lines: +3 -3

Linus 2.4.0 merge (take one)
----------------------------
...


Why am I picking up the LINUS_240 version of this file?
Is "-D" the wrong method to use?

Tried "cvs update -rLINUS_240_PREMERGE" and that seemed to do what
I think I wanted. But backs out a few recent changes. *sigh*.

thanks,
grant
