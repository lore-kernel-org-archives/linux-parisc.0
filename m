Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14516
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 13:19:24 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 93584CF4
	for <parisc-linux@thepuffingroup.com>; Thu, 18 Jan 2001 12:23:07 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id MAA14682
	for parisc-linux@thepuffingroup.com; Thu, 18 Jan 2001 12:25:02 -0800 (PST)
Date: Thu, 18 Jan 2001 12:25:02 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200101182025.MAA14682@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 64-bit "Internal compiler error" emit-rtl.c:1560
List-ID: <linux-parisc.vger.kernel.org>


Hi toolchain experts,

I'm working on kernel CONFIG_SMP support and can't compile a 64-bit kernel.
32-bit toolchain builds and links a (buggy) kernel.
Using the xc-20010117.tar.gz provided by Matt in both cases.

Any clues what's wrong?

thanks,
grant

Enabled CONFIG_SMP with the following sequence:
    cvs update -A
    vi Makefile		# set ARCH=parisc64 and CROSS_COMPILE=hppa64-linux-
    make oldconfig
    vi .config		# set CONFIG_SMP=y
    make oldconfig
    make -j4 dep

and then:

grundler <576>make palo
make: Circular /linux/smp64/linux/include/asm/smp.h <- /linux/smp64/linux/include/linux/sched.h dependency dropped.
hppa64-linux-gcc -D__KERNEL__ -I/linux/smp64/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mschedule=7200 -fno-strict-aliasing -ffunction-sections   -c -o init/main.o init/main.c
In file included from /linux/smp64/linux/include/linux/fs.h:12,
                 from /linux/smp64/linux/include/linux/capability.h:17,
                 from /linux/smp64/linux/include/linux/binfmts.h:5,
                 from /linux/smp64/linux/include/linux/sched.h:9,
                 from /linux/smp64/linux/include/linux/mm.h:4,
                 from /linux/smp64/linux/include/linux/slab.h:14,
                 from /linux/smp64/linux/include/linux/malloc.h:4,
                 from /linux/smp64/linux/include/linux/proc_fs.h:5,
                 from init/main.c:15:
/linux/smp64/linux/include/linux/wait.h:129: Internal compiler error in operand_subword_force, at emit-rtl.c:1560
   Please submit a full bug report.
   See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make: *** [init/main.o] Error 2
grundler <577>
