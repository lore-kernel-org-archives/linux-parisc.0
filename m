Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAB07482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 01:25:35 -0600 (MDT)
To: carlos@baldric.uwo.ca
Subject: Re: [parisc-linux] kdb patches for -pa23 ... moooo!
Message-ID: <1020756305.3cd7815151303@webmail.tiscalinet.be>
Date: Tue, 07 May 2002 09:25:05 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi Carlos,

Well I well get your patch which I apply successfully against pa23.

On the other hand, I also reach to rebuild a toolchain with gcc-3.1 (some
difficulties with 3.2).

So to try to figure out what the problem is with kernel IP compile with gcc >
3.1, I try to compile kernel 2.4.18-pa23-kdb with gcc 3.1. But without any
experience with kdb the operation failled with following message:

gcc -D__KERNEL__
-I/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing
-fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7100   -DKBUILD_BASENAME=traps  -c -o traps.o traps.c
traps.c:50:23: linux/kdb.h: No such file or directory
traps.c: In function `die_if_kernel':
traps.c:310: warning: implicit declaration of function `kdb'
traps.c:310: `KDB_REASON_OOPS' undeclared (first use in this function)
traps.c:310: (Each undeclared identifier is reported only once
traps.c:310: for each function it appears in.)
traps.c: In function `handle_break':
traps.c:383: `KDB_BREAK_ENTER_INSN' undeclared (first use in this function)
traps.c:384: `KDB_REASON_ENTER' undeclared (first use in this function)
traps.c:387: `KDB_BREAK_BREAK_INSN' undeclared (first use in this function)
traps.c:388: `KDB_REASON_BREAK' undeclared (first use in this function)
traps.c: In function `handle_interruption':
traps.c:657: `KDB_REASON_DEBUG' undeclared (first use in this function)
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/include/asm/irq.h: At
top level:
traps.c:130: warning: `dump_stack' defined but not used
make[1]: *** [traps.o] Error 1
make[1]: Leaving directory
`/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2
Mon May  6 20:52:40 CEST 2002

Hmm the patch put kdb.h in include/asm-parisc but all #include refer to linux/kdb.h?

There should be also some problem with my .config where I select 
CONFIG_KDB=y
CONFIG_KDB_MODULES=y
# CONFIG_KDB_OFF is not set
CONFIG_KALLSYMS=y

(the rest is obtain for a common make oldconfig for PA7000 processor type)

Thanks in advance for additionnal help,
    Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
