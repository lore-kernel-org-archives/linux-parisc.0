From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: [parisc-linux] gcc fails to build using binutils-2.14.90.0.1
Date: Sun, 18 May 2003 16:36:43 +0200
Message-ID: <16071.39547.93843.710060__23959.907415747$1416622462$gmane$org@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

binutils-2.13.90.0.18 works ok.

See http://buildd.debian.org/fetch.php?&pkg=gcc-3.3&ver=1%3A3.3ds9-2&arch=hppa&stamp=1053264270&file=log&as=raw:

./xgcc -B./ -B/usr/hppa-linux/bin/ -isystem /usr/hppa-linux/include -isystem /usr/hppa-linux/sys-include -O2  -DIN_GCC    -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem ./include  -fPIC -DELF=1 -DLINUX=1 -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I. -I../../src/gcc -I../../src/gcc/. -I../../src/gcc/config -I../../src/gcc/../include -DL_mulI -xassembler-with-cpp -c ../../src/gcc/config/pa/milli64.S -o libgcc/./_mulI.o
../../src/gcc/config/pa/milli64.S: Assembler messages:
../../src/gcc/config/pa/milli64.S:1779: Error: Undefined .EXPORT/.IMPORT argument (ignored): 
../../src/gcc/config/pa/milli64.S:1779: Error: Undefined .EXPORT/.IMPORT argument (ignored): millicode
make[5]: *** [libgcc/./_mulI.o] Error 1
