Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hera.cs.brandeis.edu (hera.cs.brandeis.edu [129.64.3.192])
	by dsl2.external.hp.com (Postfix) with ESMTP id A60B8482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Apr 2002 21:27:52 -0600 (MDT)
Received: (from aaronm@localhost)
	by hera.cs.brandeis.edu (8.9.3/8.9.3) id XAA01256
	for parisc-linux@lists.parisc-linux.org; Mon, 22 Apr 2002 23:27:50 -0400
Date: Mon, 22 Apr 2002 23:27:50 -0400
From: Aaron Macks <aaronm@cs.brandeis.edu>
To: PARISC-Linux <parisc-linux@lists.parisc-linux.org>
Message-ID: <20020422232750.B1244@hera.cs.brandeis.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Copmpiling ifenslave
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I don't know if anyone else has tried this, but trying to compile
Becker's ifenslave commmand on a 0.93 box(kernel rebuilt to 2.4.18-pa0
yielded this mess:
ifenslave(.data+0x8c):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `opt_f'
/tmp/ccDAhJJg.o(.data+0x7c): first defined here
ifenslave(.data+0x18):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `longopts'
/tmp/ccDAhJJg.o(.data+0x8): first defined here
ifenslave(.data+0x90):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `opt_r'
/tmp/ccDAhJJg.o(.data+0x80): first defined here
ifenslave(.data+0x94):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `verbose'
/tmp/ccDAhJJg.o(.data+0x84): first defined here
ifenslave: In function `_init':
ifenslave(.init+0x0): multiple definition of `_init'
/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../crti.o(.init+0x0): first
defined here
ifenslave(.data+0x98):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `skfd'
/tmp/ccDAhJJg.o(.data+0x88): first defined here
ifenslave: In function `_start':
ifenslave(.text+0x0): multiple definition of `_start'
/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../crt1.o(.text+0x0): first
defined here
ifenslave(.text+0x100):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `main'
/tmp/ccDAhJJg.o(.text+0x0): first defined here
/usr/bin/ld: Warning: size of symbol `main' changed from 3032 to 2589
in ifenslave
ifenslave(.data+0x88):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `opt_a'
/tmp/ccDAhJJg.o(.data+0x78): first defined here
ifenslave(.fini+0x0):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `_fini'
/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../crti.o(.fini+0x0): first
defined here
ifenslave(.rodata+0x4):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
multiple definition of `_IO_stdin_used'
/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../crt1.o(.rodata+0x0): first
defined here
/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../crt1.o(.dynamic+0x0):
multiple definition of `_DYNAMIC'
ifenslave(.dynamic+0x0):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
first defined here
/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../crt1.o(.got+0x0): multiple
definition of `_GLOBAL_OFFSET_TABLE_'
ifenslave(.got+0x0):/usr/src/build/53700-i386/BUILD/glibc-2.2.4/csu/init.c:
first defined here
/usr/bin/ld: .got section not immediately after .plt section
collect2: ld returned 1 exit status

is this just a signal to upgrade gcc and glibc or is there more to it?
Aaron
-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!
