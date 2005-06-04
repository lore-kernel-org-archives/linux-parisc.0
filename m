From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [mingo@elte.hu: [patch] spinlock consolidation, v2]
Date: Sat, 04 Jun 2005 11:55:03 +0000
Message-ID: <42A19697.8010501@tiscali.be>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Matthew, Mingo,

Matthew Wilcox wrote:
> Anyone have time to test this out?
> 
> ----- Forwarded message from Ingo Molnar <mingo@elte.hu> -----
> 
> Date:	Fri, 3 Jun 2005 17:40:29 +0200
> From:	Ingo Molnar <mingo@elte.hu>
> Subject: [patch] spinlock consolidation, v2
> 
> the latest version of the spinlock consolidation patch can be found at:
> 
>   http://redhat.com/~mingo/spinlock-patches/consolidate-spinlocks.patch
> 
> the patch is now complete in the sense that it does everything i wanted 
> it to do. If you have any other suggestions (or i have missed to 
> incorporate an earlier suggestion of yours), please yell.
> 
I applied against one of our latest 2.6.12-rc5-pa1 without pb :-)

Any way it failled to compile very early with following messages:
   gcc -Wp,-MD,arch/parisc/kernel/.asm-offsets.s.d  -nostdinc -isystem /usr/lib/gcc-lib/hppa-linux/3.3.5/include -D__KERNEL__ 
-Iinclude -Iinclude2 -I/usr/src/linux-2.6.12-rc5-pa1-050601/include -I/usr/src/linux-2.6.12-rc5-pa1-050601/arch/parisc/kernel 
-Iarch/parisc/kernel -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2 
-fomit-frame-pointer -pipe -mno-space-regs -mfast-indirect-calls -ffunction-sections -march=1.1 -mschedule=7200 
-DKBUILD_BASENAME=asm_offsets -DKBUILD_MODNAME=asm_offsets -S -o arch/parisc/kernel/asm-offsets.s 
/usr/src/linux-2.6.12-rc5-pa1-050601/arch/parisc/kernel/asm-offsets.c
In file included from include2/asm/bitops.h:5,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/spinlock.h:51,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/system.h:174: error: syntax error before "pa_tlb_lock"
include2/asm/system.h:174: warning: type defaults to `int' in declaration of `pa_tlb_lock'
include2/asm/system.h:174: warning: data definition has no type or storage class
In file included from include2/asm/atomic.h:17,
                  from include2/asm/bitops.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/spinlock.h:51,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/spinlock.h:11: error: syntax error before '*' token
include2/asm/spinlock.h:12: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_spin_is_locked':
include2/asm/spinlock.h:13: error: `x' undeclared (first use in this function)
include2/asm/spinlock.h:13: error: (Each undeclared identifier is reported only once
include2/asm/spinlock.h:13: error: for each function it appears in.)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:21: error: syntax error before '*' token
include2/asm/spinlock.h:22: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_spin_lock':
include2/asm/spinlock.h:26: error: `x' undeclared (first use in this function)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:32: error: syntax error before '*' token
include2/asm/spinlock.h:33: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_spin_unlock':
include2/asm/spinlock.h:36: error: `x' undeclared (first use in this function)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:41: error: syntax error before '*' token
include2/asm/spinlock.h:42: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_spin_trylock':
include2/asm/spinlock.h:47: error: `x' undeclared (first use in this function)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:64: error: syntax error before '*' token
include2/asm/spinlock.h:65: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_read_lock':
include2/asm/spinlock.h:68: error: `rw' undeclared (first use in this function)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:76: error: syntax error before '*' token
include2/asm/spinlock.h:77: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_read_unlock':
include2/asm/spinlock.h:80: error: `rw' undeclared (first use in this function)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:97: error: syntax error before '*' token
include2/asm/spinlock.h:98: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_write_lock':
include2/asm/spinlock.h:100: error: `rw' undeclared (first use in this function)
include2/asm/spinlock.h:107: warning: implicit declaration of function `cpu_relax'
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:118: error: syntax error before '*' token
include2/asm/spinlock.h:119: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_write_unlock':
include2/asm/spinlock.h:120: error: `rw' undeclared (first use in this function)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:124: error: syntax error before '*' token
include2/asm/spinlock.h:125: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_write_trylock':
include2/asm/spinlock.h:126: error: `rw' undeclared (first use in this function)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:139: error: syntax error before '*' token
include2/asm/spinlock.h:140: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_is_read_locked':
include2/asm/spinlock.h:141: error: `rw' undeclared (first use in this function)
include2/asm/spinlock.h: At top level:
include2/asm/spinlock.h:144: error: syntax error before '*' token
include2/asm/spinlock.h:145: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_is_write_locked':
include2/asm/spinlock.h:146: error: `rw' undeclared (first use in this function)
In file included from include2/asm/bitops.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/spinlock.h:51,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/atomic.h: At top level:
include2/asm/atomic.h:27: error: syntax error before "__atomic_hash"
include2/asm/atomic.h:27: warning: type defaults to `int' in declaration of `__atomic_hash'
include2/asm/atomic.h:27: warning: data definition has no type or storage class
include2/asm/atomic.h: In function `__atomic_add_return':
include2/asm/atomic.h:143: error: `spinlock_t' undeclared (first use in this function)
include2/asm/atomic.h:143: error: `s' undeclared (first use in this function)
include2/asm/atomic.h:143: warning: implicit declaration of function `_raw_spin_lock'
include2/asm/atomic.h:147: warning: implicit declaration of function `_raw_spin_unlock'
include2/asm/atomic.h: In function `atomic_set':
include2/asm/atomic.h:154: error: `spinlock_t' undeclared (first use in this function)
include2/asm/atomic.h:154: error: `s' undeclared (first use in this function)
In file included from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/spinlock.h:51,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/bitops.h: In function `set_bit':
include2/asm/bitops.h:45: error: `spinlock_t' undeclared (first use in this function)
include2/asm/bitops.h:45: error: `s' undeclared (first use in this function)
include2/asm/bitops.h: In function `clear_bit':
include2/asm/bitops.h:63: error: `spinlock_t' undeclared (first use in this function)
include2/asm/bitops.h:63: error: `s' undeclared (first use in this function)
include2/asm/bitops.h: In function `change_bit':
include2/asm/bitops.h:81: error: `spinlock_t' undeclared (first use in this function)
include2/asm/bitops.h:81: error: `s' undeclared (first use in this function)
include2/asm/bitops.h: In function `test_and_set_bit':
include2/asm/bitops.h:100: error: `spinlock_t' undeclared (first use in this function)
include2/asm/bitops.h:100: error: `s' undeclared (first use in this function)
include2/asm/bitops.h: In function `test_and_clear_bit':
include2/asm/bitops.h:127: error: `spinlock_t' undeclared (first use in this function)
include2/asm/bitops.h:127: error: `s' undeclared (first use in this function)
include2/asm/bitops.h: In function `test_and_change_bit':
include2/asm/bitops.h:154: error: `spinlock_t' undeclared (first use in this function)
include2/asm/bitops.h:154: error: `s' undeclared (first use in this function)
In file included from include2/asm/thread_info.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/thread_info.h:21,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/spinlock.h:51,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/processor.h: At top level:
include2/asm/processor.h:90: error: syntax error before "spinlock_t"
include2/asm/processor.h:90: warning: no semicolon at end of struct or union
include2/asm/processor.h:102: error: syntax error before '}' token
In file included from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/spinlock.h:79,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa1-050601/arch/parisc/kernel/asm-offsets.c:31:
/usr/src/linux-2.6.12-rc5-pa1-050601/include/linux/spinlock_types.h:26: error: `spinlock_t' used prior to declaration
make[2]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 2
make: *** [vmlinux] Error 2
====<>====

What did I missed?

Thanks,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
