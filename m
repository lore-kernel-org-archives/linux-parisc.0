Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D8144871
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 07:44:07 -0600 (MDT)
Message-Id: <200207121344.g6CDi4vc017066@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem building gcc-3.2 (cvs head) on hppa-linux
To: randolph@tausq.org
Date: Fri, 12 Jul 2002 09:44:04 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: gcc@gcc.gnu.org, parisc-linux@parisc-linux.org
In-Reply-To: <20020712072703.GA8838@tausq.org> from "Randolph Chung" at Jul 12, 2002 00:27:03 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Trying to build CVS head (3.2 20020711) with:
> 
> configure --host=hppa-linux --build=hppa-linux --target=hppa64-linux
> --enable-shared --disable-nls --enable-languages=c
> 
> I get:
> 
> /home/tausq/build/gcc-3.2/gcc/xgcc -B/home/tausq/build/gcc-3.2/gcc/ -B/home/tausq/opt/gnu/hppa64-linux/bin/ -B/home/tausq/opt/gnu/hppa64-linux/lib/ -isystem /home/tausq/opt/gnu/hppa64-linux/include -O2  -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem ./include  -fPIC -Dpa64=1 -DELF=1 -g  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -I.
> -I. -I/home/tausq/src/gcc-3.2/gcc -I/home/tausq/src/gcc-3.2/gcc/. -I/home/tausq/src/gcc-3.2/gcc/config -I/home/tausq/src/gcc-3.2/gcc/../include  -DL__gcc_bcmp -c /home/tausq/src/gcc-3.2/gcc/libgcc2.c -o libgcc/./__gcc_bcmp.o
> /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c: In function `uw_frame_state_for':
> /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:906: warning: implicit declaration of function `memset'
> /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c: In function `uw_install_context_1':
> /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:1193: warning: implicit declaration of
> function `memcpy'
> In file included from /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:1210:
> /home/tausq/src/gcc-3.2/gcc/unwind.inc: In function `_Unwind_RaiseException':
> /home/tausq/src/gcc-3.2/gcc/unwind.inc:132: error: Attempt to delete prologue/epilogue insn:
> (insn 337 336 338 14 (nil) (set (reg:DI 7 %r7)
>         (mem:DI (plus:DI (reg/f:DI 30 %r30)
>                 (const_int -296 [0xfffffffffffffed8])) [0 S8 A64])) -1 (nil)
>     (nil))
> /home/tausq/src/gcc-3.2/gcc/unwind.inc:132: internal compiler error: Internal compiler error in propagate_one_insn, at flow.c:1637
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
> make[2]: *** [libgcc/./unwind-dw2.o] Error 1
> make[2]: Leaving directory `/home/tausq/build/gcc-3.2/gcc'
> make[1]: *** [libgcc.a] Error 2
> make[1]: Leaving directory `/home/tausq/build/gcc-3.2/gcc'
> make: *** [all-gcc] Error 2
> 
> The bootstrapping compiler is gcc-3.0.4

Yes.  This is one of the manifestations of the the long call bug
in 3.0.4.  You need to use "-O2" in STAGE1_CFLAGS to work around
it or use gcc 3.1 later as a bootstrap compiler.  You will have
the same problem if you try to rebuild 3.0.x.  There is a silent
miscompilation of expr.c if I remember correctly.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
