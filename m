Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 445224A19
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Mar 2001 11:10:22 -0700 (MST)
Date: Wed, 7 Mar 2001 10:10:07 -0800 (PST)
From: Jason Eckhardt <jle@cygnus.com>
To: Paul Bame <bame@fc.hp.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Alan Modra <alan@linuxcare.com.au>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] INLINE_SYSCALL/gcc-bug? (Was Re: pipes)
In-Reply-To: <E14ahuS-0001t2-00@noam.fc.hp.com>
Message-ID: <Pine.SOL.3.91.1010307100801.6842A-100000@cse.cygnus.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


Hi,

On Wed, 7 Mar 2001, Paul Bame wrote:

> 
> Help!  Probable gcc bug!
> 
>     #define INLINE_SYSCALL(name, nr, args...)       ({              \
> 	    unsigned long __sys_res;                                \
> 	    {                                                       \
> 		    register unsigned long __res asm("r28");        \
> 		    LOAD_ARGS_##nr(args)                            \
> 		    asm volatile(                                   \
> 			    "ble  0x100(%%sr2, %%r0)\n\t"   \
> 			    " ldi %1, %%r20"                        \
> 			    : "=r" (__res)                          \
> 			    : "i" (SYS_ify(name)) ASM_ARGS_##nr     \
> 			     );                                     \
> 		    __sys_res = __res;                              \
> 	    }                                                       \
> 	    if (__sys_res >= (unsigned long)-4095) {                \
> 		    __set_errno(-__sys_res);                        \
> 		    __sys_res == (unsigned long)-1;                 \

                             ^^^^
     Perhaps this is why no code is generated to set __sys_res to -1?
     Or am I out of my mind?

     
> 	    }                                                       \
> 	    __sys_res;                                              \
>     })
> 
