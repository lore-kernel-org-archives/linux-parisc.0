From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Compiling a 32bit kernel fails
Date: Thu, 24 Jul 2014 13:39:45 +0200
Message-ID: <828ecd1c2a7868e1f1ef7025f9f1e930@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



I've been trying to compile a 3.15.6 kernel but I did not managed to do=
=20
so with either gcc 4.7.3 or 4.8.3.


This is the error I get :

In file included from=20
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/spinlock.h:5:0,
                  from=20
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/atomic.h:20,
                  from include/linux/atomic.h:4,
                  from=20
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/bitops.h:11,
                  from include/linux/bitops.h:33,
                  from include/linux/kernel.h:10,
                  from=20
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/bug.h:4,
                  from include/linux/bug.h:4,
                  from include/linux/thread_info.h:11,
                  from include/asm-generic/preempt.h:4,
                  from arch/parisc/include/generated/asm/preempt.h:1,
                  from include/linux/preempt.h:18,
                  from include/linux/spinlock.h:50,
                  from include/linux/mmzone.h:7,
                  from include/linux/gfp.h:5,
                  from include/linux/slab.h:14,
                  from kernel/signal.c:13:
kernel/signal.c: In function =E2=80=98get_signal_to_deliver=E2=80=99:
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/ldcw.h:39:2:=20
error: can=E2=80=99t find a register in class =E2=80=98R1_REGS=E2=80=99=
 while reloading =E2=80=98asm=E2=80=99
   __asm__ __volatile__(__LDCW " 0(%2),%0"   \
   ^
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/spinlock.h:26:9:=20
note: in expansion of macro =E2=80=98__ldcw=E2=80=99
   while (__ldcw(a) =3D=3D 0)
          ^
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/ldcw.h:39:2:=20
error: =E2=80=98asm=E2=80=99 operand has impossible constraints
   __asm__ __volatile__(__LDCW " 0(%2),%0"   \
   ^
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/spinlock.h:26:9:=20
note: in expansion of macro =E2=80=98__ldcw=E2=80=99
   while (__ldcw(a) =3D=3D 0)
          ^

As far as I can tell, it looks familiar :
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D60925
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D35193


Is the fix to modify the LDCW macro or fix gcc ?

   Guy

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
