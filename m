From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] kernel crash in free_block? (c3k, 32-bit, UP)
Date: Sun, 19 Sep 2004 22:23:37 -0400
Message-ID: <20040920022336.GP17238@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


pa,

Configured with: ../src/configure -v
--enable-languages=c,c++,java,f77,pascal,objc,ada,treelang --prefix=/usr
--mandir=/usr/share/man --infodir=/usr/share/info
--with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared
--with-system-zlib --enable-nls --without-included-gettext
--enable-__cxa_atexit --enable-sjlj-exceptions --enable-clocale=gnu
--enable-debug --enable-java-gc=boehm --enable-java-awt=xlib
--enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.3.4 (Debian 1:3.3.4-5)

2.6.9-rc2-pa6, C3000, 32-bit UP (PA7300LC optimized).

Kernel crashed during heavy disk load.

Backtrace:
 [<1014a498>] drain_array_locked+0x90/0xc4
 [<1014a568>] cache_reap+0x9c/0x20c
 [<101389a8>] worker_thread+0x1ac/0x278
 [<1013d420>] kthread+0xdc/0xe4
 [<1010dc5c>] ret_from_kernel_thread+0x1c/0x24

Kernel Fault: Code=15 regs=10ff42c0 (Addr=b4d7fcf0)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001110 Not tainted
r00-03  00000000 1049b810 1014a498 00000008
r04-07  4fc7d2e0 4fc7d2ec 4fe21014 f0000000
r08-11  1049b810 00200200 00100100 4fc7d2fc
r12-15  00200000 00100000 103b2010 10490010
r16-19  f00008c4 f000017c f0000174 b4d7fcec
r20-23  4fc7d2ec 2b5a7000 00000011 10343fe0
r24-27  00000008 4fe21010 2b5a7214 10398010
r28-31  4ff620d0 00000002 10ff42c0 1014a5bc
sr0-3   00000000 000000d9 00000000 000000d9
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10149c08 10149c0c
 IIR: 0e741288    ISR: 00000000  IOR: b4d7fcf0
 CPU:        0   CR30: 10ff4000 CR31: 1042c000
 ORIG_R28: 00000000
 IAOQ[0]: free_block+0x90/0x158
 IAOQ[1]: free_block+0x94/0x158
 RP(r2): drain_array_locked+0x90/0xc4
Kernel panic - not syncing: Kernel Fault

The fault address is a bit weird.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
