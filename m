Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8284B4841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Nov 2003 03:57:15 -0700 (MST)
Message-ID: <3FC9CD0C.1040403@tiscali.be>
Date: Sun, 30 Nov 2003 10:57:16 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] spinlock 2.4 re-organise a la 2.6 [was: [RFC]
 rewrite kernel spinlock code to work better with gcc]
References: <20031126070714.GN975@tausq.org> <3FC93D47.5020501@tiscali.be> <20031130033705.GA24965@colo.lackof.org>
In-Reply-To: <20031130033705.GA24965@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Yes forgive that try, it breaks something in 'make dep' I presume 
because make vmlinux failled oribly:

gcc -D__KERNEL__ -I/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include 
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing 
-fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs 
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1 
-mschedule=7100   -DKBUILD_BASENAME=main -c -o init/main.o init/main.c
In file included from 
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/wait.h:16,
                  from 
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/fs.h:12,
                  from 
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/capability.h:17,
                  from 
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/binfmts.h:5,
                  from 
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/sched.h:9,
                  from 
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/mm.h:4,
                  from 
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/slab.h:14,
                  from 
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/proc_fs.h:5,
                  from init/main.c:15:
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/linux/spinlock.h:75: 
error: conflicting types for `spinlock_t'
/Debian-apt/SRC/Test/linux-2.4.23-rc5-pa17/include/asm/system.h:189: 
error: previous declaration of `spinlock_t'
make: *** [init/main.o] Error 1

My bad, sorry,
	Joel

Grant Grundler wrote:
> On Sun, Nov 30, 2003 at 12:43:51AM +0000, Joel Soete wrote:
> ...
> 
>>+++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/atomic.h	2003-11-30 01:23:57.000000000 +0100
>>@@ -1,7 +1,6 @@
>> #ifndef _ASM_PARISC_ATOMIC_H_
>> #define _ASM_PARISC_ATOMIC_H_
>> 
>>-#include <linux/config.h>
>> #include <asm/system.h>
> 
> 
> Joel,
> This is wrong - atomic.h uses CONFIG_SMP and thus is
> required to include config.h.
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
