Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F2F8482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jul 2003 22:15:46 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19cdgZ-0004yt-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 00:14:35 -0400
Date: Wed, 16 Jul 2003 00:14:35 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030716041435.GE5715@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] gcc 3.3 release x86->hppa64 failure?
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

Has anyone recently tried to bootstrap an x86->hppa64 cross-compiler?
I'm going with cvs binutils, cvs gcc -rgcc_3_3_release.

'make boostrap'
---

make[2]: Entering directory
`/mnt/fatty/src/hppa-toolchain/gcc/build/gcc'
stage1/xgcc -Bstage1/
-B/mnt/fatty/src/hppa-toolchain/parisc/hppa64-linux/bin/ -c   -g -O2
-DIN_GCC -DCROSS_COMPILE  -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long
-DHAVE_CONFIG_H -DGENERATOR_FILE    -I. -I. -I../../gcc/gcc
-I../../gcc/gcc/. -I../../gcc/gcc/config -I../../gcc/gcc/../include
../../gcc/gcc/gengenrtl.c -o gengenrtl.o
In file included from ../../gcc/gcc/gengenrtl.c:29:
../../gcc/gcc/real.h:67: error: size of array `test_real_width' is
negative
make[2]: *** [gengenrtl.o] Error 1
make[2]: Leaving directory `/mnt/fatty/src/hppa-toolchain/gcc/build/gcc'
make[1]: *** [stage2_build] Error 2
make[1]: Leaving directory `/mnt/fatty/src/hppa-toolchain/gcc/build/gcc'
make: *** [bootstrap] Error 2

---

Refs: http://gcc.gnu.org/ml/gcc/2002-10/msg01471.html

gcc/real.h
---
65 /* Verify the guess.  */
66 extern char test_real_width
67   [sizeof(REAL_VALUE_TYPE) <= REAL_WIDTH*sizeof(HOST_WIDE_INT) ? 1 : -1];
---
# 66 "../../gcc/gcc/real.h"
extern char test_real_width
  [sizeof(struct real_value) <= (((128 + (8 * 4)) + 32)/(8 * 8) + (((128
  + (8 * 4)) + 32)%(8 * 8) ? 1 : 0))*sizeof(long long) ? 1 : -1];
---

Which under a normal gcc in x86 evaluates correclty, but under the
stage1 xgcc it doesn't. How can I, obviously without having a glibc in
64-bit userspace, analyze the value of 'sizeof(struct real_value)'?

c.
