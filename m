Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9780A4853
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Jun 2002 07:32:26 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1025098342.3d19c266a0ff7@webmail.tiscalinet.be>
Date: Wed, 26 Jun 2002 15:32:22 +0200 (CEST)
From: joel.soete@freebel.net
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] gcc-3.2 failed to compile kernel
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

Hi all,

To try to investigate the network problem with compiling kernel with gcc-3.2 on
hppa, I cvs update gcc and binutils this morning. Then build toolchain and
finally make dep ; make vmlinux but it failled with following message:

make[1]: Entering directory
`/Develop/parisc-linux/src/linux-2.4.18-pa40/arch/parisc/kernel'
gcc -D__KERNEL__ -I/Develop/parisc-linux/src/linux-2.4.18-pa40/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing
-fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7100   -DKBUILD_BASENAME=cache  -c -o cache.o cache.c
gcc -D__ASSEMBLY__ -traditional -D__KERNEL__
-I/Develop/parisc-linux/src/linux-2.4.18-pa40/include  -c -o pacache.o pacache.S
In file included from pacache.S:44:
/Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/cache.h:9: 1/config.h:
No such file or directory
make[1]: *** [pacache.o] Error 1
make[1]: Leaving directory
`/Develop/parisc-linux/src/linux-2.4.18-pa40/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2

?? "1/config.h"
    ??

Any idea?

Thanks in advance,
    Joel

PS1: the same sources (2.4.18-pa40) compile and run fine when compile natively
with gcc-3.0.4 (last hppa.dpkg).

PS2: glibc used to build toolchain was based on glibc_2.2.5-4 (+ patch)


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
