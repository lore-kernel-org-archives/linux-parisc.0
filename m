Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B85C4855
	for <parisc-linux@parisc-linux.org>;
	Sat, 24 Jan 2004 18:37:51 -0700 (MST)
Date: Sat, 24 Jan 2004 18:37:49 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] missing barrier in _raw_spin_lock?
Message-ID: <20040125013749.GC16272@colo.lackof.org>
References: <4012DE98.9090605@tiscali.be>
	<200401242115.i0OLFjQ5009570@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401242115.i0OLFjQ5009570@hiauly1.hia.nrc.ca>
Cc: arnd@arndb.de, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Jan 24, 2004 at 04:15:44PM -0500, John David Anglin wrote:
> > >> static int x;
> > >> static spinlock_t lock;
...
> The test is wrong.  Static variables are initialized to 0.  So, the first
> `if' is never true and the code will optimize to a return instruction.

In any case, that should be
	static spinlock_t lock = SPIN_LOCK_UNLOCKED;

(On parisc UNLOCKED == 1, not 0 like the rest of the world)

Is gcc really that smart that it knows static variables are 0?
The would be amazing to me because I thought linker magic could
twiddle stuff like this. Anyway, gcc doesn't seem to be that smart:

# diff t1.c t2.c
3c3
< static int x=1;
---
> static int x;

# diff t1.S t2.S
3,7d2
<       .align 4
<       .type   x, @object
<       .size   x, 4
< x:
<       .word   1
54a50,51
>       .local  x
>       .comm   x,4,4


BTW, the .S diff is the same for both -O2 and -O3 output.
Maybe other compile options would further optimize.


Arndt,
In any case, thanks for raising the issue.
I hadn't looked at the asm code in a long time.

The key bit is __ldcw() in asm/system.h:

/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
#define __ldcw(a) ({ \
        unsigned __ret; \
        __asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
        __ret; \
})

I suspect (but am not certain) Arnd is right.
We indicate __ret is getting clobbered (=r) and that 'a' is an input ("r").
I don't see anything indicating we changed the memory location.

But I don't see the problem.  The t2.S output looks correct.
The "if (!x) {...}" code is generated:

...
.L18:
        ldw RR'x-$global$(%r21),%r20
        comib,<> 0,%r20,.L13
        ldi 4660,%r25
        stw %r25,RR'x-$global$(%r21)
...

BTW, PARISC still doesn't support CONFIG_SMP (cpu init sequence)
on 2.6 kernels. SMP works (mostly) on 2.4 kernels.

Here's how I generated t1.S output and it's not completely trivial.
One has to:
	o cp /usr/src/linux-2.6/include/linux/autoconf.h ./linux/
	o vi linux/autoconf.hl
		- change "#undef CONFIG_SMP" to #define
		- add "#define CONFIG_NR_CPUS 4"
	o gcc -O3 -I. -I/usr/src/linux-2.6/include/ -S t1.c -o t1.S

I've put the whole mess on
	http://iou.parisc-linux.org/~grundler/asm-memory/


BTW, I notice several other asm() in linux/asm-parisc/system.h which
specify ': "memory"' but the instructions used are register only.
Notably the ssm/rsm/mtsm insn's.
Any comment if those asm() *do NOT* need ': "memory"'?

thanks,
grant
