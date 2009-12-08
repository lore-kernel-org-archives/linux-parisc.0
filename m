From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't find a register in class 'R1_REGS' while reloading 'asm'
Date: Mon, 7 Dec 2009 20:26:26 -0500 (EST)
Message-ID: <20091208012627.1D22C4FE3@hiauly1.hia.nrc.ca>
References: <20091207223548.GA4515@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: cavokz@gmail.com (Domenico Andreoli)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091207223548.GA4515@raptus.dandreoli.com> from "Domenico Andreoli" at Dec 7, 2009 11:35:48 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> is anybody able to reproduce it? configuration is attached.
> 
>   CC      kernel/signal.o
>   kernel/signal.c: In function 'copy_siginfo_to_user':
>   kernel/signal.c:2145: warning: cast from pointer to integer of different size
>   kernel/signal.c:2145: warning: cast from pointer to integer of different size
>   kernel/signal.c:2152: warning: cast from pointer to integer of different size
>   kernel/signal.c:2152: warning: cast from pointer to integer of different size
>   kernel/signal.c:2168: warning: cast from pointer to integer of different size
>   kernel/signal.c:2168: warning: cast from pointer to integer of different size
>   kernel/signal.c: In function 'do_sigaltstack':
>   kernel/signal.c:2489: warning: cast from pointer to integer of different size
>   kernel/signal.c:2489: warning: cast from pointer to integer of different size
>   kernel/signal.c: In function 'get_signal_to_deliver':
>   /home/cavok/devel/kernel/linux-2.6.git/arch/parisc/include/asm/spinlock.h:25: error: can't find a register in class 'R1_REGS' while reloading 'asm'
>   /home/cavok/devel/kernel/linux-2.6.git/arch/parisc/include/asm/spinlock.h:25: error: 'asm' operand has impossible constraints

I didn't get this error by just enabling SMP.

The asm at spinlock.h:25 doesn't directly use r1.  I think the only way
this might happen is 'a' is spilled to the stack at a very large offset
from the stack pointer.  The load of the offset may need r1.  There also
has to be some other code that has stolen r1 prior to the asm.

The register allocation and inlining in gcc various significantly from
one version.  So, a different gcc version might work better.  At least
one version of gcc seemed to want to nest asm's.

To debug, preprocessed source and exact gcc command line is needed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
