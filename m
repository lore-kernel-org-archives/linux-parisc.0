Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 440244829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Dec 2002 13:54:05 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15884.48522.342368.76461@gargle.gargle.HOWL>
Date: Fri, 27 Dec 2002 21:52:26 +0100
To: gcc@gcc.gnu.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] [gcc-3_3-branch] bootstrap failure on hppa-linux
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

trying to bootstrap today's gcc-3_3-branch with gcc-3_2-branch
(20021212) fails in stage1 (binutils are 2.13.90.0.16-1). Adding the
mentioned -ffunction-sections as STAGE1_CFLAGS lets the bootstrap
succeed. However I couldn't find any hints on the special boot flags.

$ gcc-3.2    -g -DIN_GCC   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long -fno-common  -DHAVE_CONFIG_H -o cc1 c-parse.o c-lang.o c-pretty-print.o attribs.o c-errors.o c-lex.o c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-common.o c-opts.o c-format.o c-semantics.o c-objc-common.o c-dump.o libcpp.a  main.o libbackend.a   ../libiberty/libiberty.a
/usr/bin/ld: libbackend.a(expr.o)(.text+0x3f744): cannot reach 000002c9_$$dyncall+0, recompile with -ffunction-sections
/usr/bin/ld: libbackend.a(expr.o)(.text+0x3f744): cannot handle R_PARISC_PCREL17F for $$dyncall
/usr/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status
