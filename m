Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21B65482A
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 01:22:20 -0600 (MDT)
Date: Fri, 12 Jul 2002 00:27:03 -0700
From: Randolph Chung <randolph@tausq.org>
To: gcc@gcc.gnu.org
Cc: parisc-linux@parisc-linux.org
Message-ID: <20020712072703.GA8838@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problem building gcc-3.2 (cvs head) on hppa-linux
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

Trying to build CVS head (3.2 20020711) with:

configure --host=hppa-linux --build=hppa-linux --target=hppa64-linux
--enable-shared --disable-nls --enable-languages=c

I get:

/home/tausq/build/gcc-3.2/gcc/xgcc -B/home/tausq/build/gcc-3.2/gcc/ -B/home/tausq/opt/gnu/hppa64-linux/bin/ -B/home/tausq/opt/gnu/hppa64-linux/lib/ -isystem /home/tausq/opt/gnu/hppa64-linux/include -O2  -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem ./include  -fPIC -Dpa64=1 -DELF=1 -g  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -I.
-I. -I/home/tausq/src/gcc-3.2/gcc -I/home/tausq/src/gcc-3.2/gcc/. -I/home/tausq/src/gcc-3.2/gcc/config -I/home/tausq/src/gcc-3.2/gcc/../include  -DL__gcc_bcmp -c /home/tausq/src/gcc-3.2/gcc/libgcc2.c -o libgcc/./__gcc_bcmp.o
/home/tausq/src/gcc-3.2/gcc/unwind-dw2.c: In function `uw_frame_state_for':
/home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:906: warning: implicit declaration of function `memset'
/home/tausq/src/gcc-3.2/gcc/unwind-dw2.c: In function `uw_install_context_1':
/home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:1193: warning: implicit declaration of
function `memcpy'
In file included from /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:1210:
/home/tausq/src/gcc-3.2/gcc/unwind.inc: In function `_Unwind_RaiseException':
/home/tausq/src/gcc-3.2/gcc/unwind.inc:132: error: Attempt to delete prologue/epilogue insn:
(insn 337 336 338 14 (nil) (set (reg:DI 7 %r7)
        (mem:DI (plus:DI (reg/f:DI 30 %r30)
                (const_int -296 [0xfffffffffffffed8])) [0 S8 A64])) -1 (nil)
    (nil))
/home/tausq/src/gcc-3.2/gcc/unwind.inc:132: internal compiler error: Internal compiler error in propagate_one_insn, at flow.c:1637
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[2]: *** [libgcc/./unwind-dw2.o] Error 1
make[2]: Leaving directory `/home/tausq/build/gcc-3.2/gcc'
make[1]: *** [libgcc.a] Error 2
make[1]: Leaving directory `/home/tausq/build/gcc-3.2/gcc'
make: *** [all-gcc] Error 2

The bootstrapping compiler is gcc-3.0.4

any ideas?
randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
