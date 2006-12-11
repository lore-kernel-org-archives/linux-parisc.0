From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] About lockdep: failed to build
Date: Mon, 11 Dec 2006 11:21:27 +0100
Message-ID: <JA3U3R$DEA0492018ABF202C53B203ACCE05ACB__43597.0437516973$1416624229$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
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

Hi all,

Just giving a try of new lock dep, I got following build failure:

mkdir -p arch/parisc/kernel/
  hppa64-linux-gnu-gcc -Wp,-MD,arch/parisc/kernel/.asm-offsets.s.d  -nost=
dinc
-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.2/include -
D__KERNEL__ -Iinclude -Iinclude2 -I/CAD/linux-2.6.19-lockdep-20061207/inc=
lude
-include include/linux/autoconf.h -I/CAD/linux-2.6.19-
lockdep-20061207/. -I. -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -O2 -pipe -mno-space-regs -
mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=3D2.0
-mschedule=3D8000 -fomit-frame-pointer -fno-stack-protector -Wdec
laration-after-statement -Wno-pointer-sign  -D"KBUILD_STR(s)=3D#s"
-D"KBUILD_BASENAME=3DKBUILD_STR(asm_offsets)"  -D"KBUILD_MODNAME=3DKBUI
LD_STR(asm_offsets)" -fverbose-asm -S -o arch/parisc/kernel/asm-offsets.s=

/CAD/linux-2.6.19-lockdep-20061207/arch/parisc/kernel/asm-
offsets.c
In file included from include2/asm/bitops.h:7,
                 from /CAD/linux-2.6.19-lockdep-20061207/include/linux/bi=
tops.h:9,
                 from
/CAD/linux-2.6.19-lockdep-20061207/include/linux/thread_info.h:20,
                 from
/CAD/linux-2.6.19-lockdep-20061207/include/linux/preempt.h:9,
                 from
/CAD/linux-2.6.19-lockdep-20061207/include/linux/spinlock.h:49,
                 from
/CAD/linux-2.6.19-lockdep-20061207/include/linux/capability.h:45,
                 from /CAD/linux-2.6.19-lockdep-20061207/include/linux/sc=
hed.h:46,
                 from
/CAD/linux-2.6.19-lockdep-20061207/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/atomic.h: In function '__atomic_add_return':
include2/asm/atomic.h:143: error: too many arguments to function
'__raw_local_irq_save'
include2/asm/atomic.h:147: warning: implicit declaration of function
'__raw_local_irq_restore'
include2/asm/atomic.h: In function 'atomic_set':
include2/asm/atomic.h:154: error: too many arguments to function
'__raw_local_irq_save'
include2/asm/atomic.h: In function '__atomic64_add_return':
include2/asm/atomic.h:233: error: too many arguments to function
'__raw_local_irq_save'
include2/asm/atomic.h: In function 'atomic64_set':
include2/asm/atomic.h:245: error: too many arguments to function
'__raw_local_irq_save'
In file included from /CAD/linux-2.6.19-lockdep-20061207/include/linux/bi=
tops.h:9,
                 from
/CAD/linux-2.6.19-lockdep-20061207/include/linux/thread_info.h:20,
                 from
/CAD/linux-2.6.19-lockdep-20061207/include/linux/preempt.h:9,
                 from
/CAD/linux-2.6.19-lockdep-20061207/include/linux/spinlock.h:49,
                 from
/CAD/linux-2.6.19-lockdep-20061207/include/linux/capability.h:45,
                 from /CAD/linux-2.6.19-lockdep-20061207/include/linux/sc=
hed.h:46,
                 from
/CAD/linux-2.6.19-lockdep-20061207/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/bitops.h: In function 'set_bit':
include2/asm/bitops.h:33: error: too many arguments to function
'__raw_local_irq_save'
include2/asm/bitops.h: In function 'clear_bit':
include2/asm/bitops.h:44: error: too many arguments to function
'__raw_local_irq_save'
include2/asm/bitops.h: In function 'change_bit':
include2/asm/bitops.h:55: error: too many arguments to function
'__raw_local_irq_save'
include2/asm/bitops.h: In function 'test_and_set_bit':
include2/asm/bitops.h:67: error: too many arguments to function
'__raw_local_irq_save'
include2/asm/bitops.h: In function 'test_and_clear_bit':
include2/asm/bitops.h:82: error: too many arguments to function
'__raw_local_irq_save'
include2/asm/bitops.h: In function 'test_and_change_bit':
include2/asm/bitops.h:97: error: too many arguments to function
'__raw_local_irq_save'
make[2]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
make[1]: *** [prepare0] Error 2
make: *** [vmlinux] Error 2

A quick look at the first pb into precompile stuff:
asm-offsets.i
[snip]
static __inline__ __attribute__((always_inline)) int __atomic_add_return(=
int
i, atomic_t *v)
{
 int ret;
 unsigned long flags;
 do { raw_spinlock_t *s =3D (&(__atomic_hash[ (((unsigned long) v)/64) & =
(4 -1)
])); __raw_local_irq_save(flags); __raw_spin_lock_flag
s(s, 0); } while(0);

 ret =3D (v->counter +=3D i);
[snip]

May be did I missed something in my git download:
As it's on another system I first clone git tree:
    # git-clone http://www.parisc-linux.org/git/linux-2.6.git parisc-2.6
(no other protocle available)
    # cd parisc-2.6
    # git-pull origin lockdep:lockdep

(a quick check seems that
<http://git.parisc-linux.org/?p=3Dlinux-2.6.git;a=3Dcommitdiff;h=3D424ecd=
8b73ae27bd97bf2f8e987239d3d2ee2d08>
is well in this local tree?)

Hth,
    Joel

PS: Just quick and dirty test, unfortunately I don't have any more much m=
ore
time to investigate in more details, sorry.---=0AScarlet One - Combinez l=
'ADSL avec la telephonie fixe illimitee et epargnez 400 euros=0Ahttp://ww=
w.scarlet.be =0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
