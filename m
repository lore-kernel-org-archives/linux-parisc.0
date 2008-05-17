From: Adrian Bunk <bunk@kernel.org>
Subject: parisc setup_sigcontext32() array overflows
Date: Sat, 17 May 2008 22:16:37 +0300
Message-ID: <20080517191636.GA8140@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: kyle@parisc-linux.org, matthew@wil.cx, grundler@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

include/asm-parisc/ptrace.h:

<--  snip  -->

...
struct pt_regs {
        unsigned long gr[32];   /* PSW is in gr[0] */
...
}

<--  snip  -->


arch/parisc/kernel/signal32.c:

<--  snip  -->

...
setup_sigcontext32(struct compat_sigcontext __user *sc, struct compat_regfile __user * rf, 
                struct pt_regs *regs, int in_syscall)            
{
...
                /* Store upper half */
                compat_reg = (compat_uint_t)(regs->gr[32] >> 32);
...                                                   ^^
                /* Store upper half */
                compat_reg = (compat_uint_t)((regs->gr[32]+4) >> 32);
...                                                    ^^

<--  snip  -->


Spotted by the GNU C compiler.


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

