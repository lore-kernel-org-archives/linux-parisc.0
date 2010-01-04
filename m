From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 4 Jan 2010 12:32:38 -0500 (EST)
Message-ID: <20100104173239.6C0AF5183@hiauly1.hia.nrc.ca>
References: <20100104162732.10090@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, dave.anglin@nrc-cnrc.gc.ca,
	carlos@systemhalted.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100104162732.10090@gmx.net> from "Helge Deller" at Jan 4, 2010 05:27:32 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I think I have an idea what could have happened and why it most of the times (but not always) crashes in the child process...
> 
> In ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h we have:
> #define atomic_compare_and_exchange_val_acq(mem, newval, oldval) \
>   ({                                                                    \
>      volatile int lws_errno;                                            \
>      volatile int lws_ret;                                              \
>      asm volatile(                                                      \
> ...some assembly...
>         "stw    %%r28, %0                       \n\t"                   \
>         "sub    %%r0, %%r21, %%r21              \n\t"                   \
>         "stw    %%r21, %1                       \n\t"                   \
>         : "=m" (lws_ret), "=m" (lws_errno)                              \
>         : "r" (mem), "r" (oldval), "r" (newval)                         \
>         : _LWS_CLOBBER           
> 
> this means, that lws_errno and lws_ret are located on the stack.
> 
> With gdb I see this expanded to:
> 0x40705494 <start_thread+1204>: stw ret0,-1b8(sp)
> 0x40705498 <start_thread+1208>: sub r0,r21,r21
> 0x4070549c <start_thread+1212>: stw r21,-1b4(sp)
> 
> So, lws_ret/lws_errno are at -1b8/-1b4(sp).
> 
> And this LWS code is called from 
> ../nptl/sysdeps/pthread/createthread.c:
> static int create_thread (struct pthread *pd, const struct pthread_attr *attr, STACK_VARIABLES_PARMS)
> ...
>           int res = do_clone (pd, attr, clone_flags, start_thread,
>                               STACK_VARIABLES_ARGS, 1);
>           if (res == 0)
>             {
> ...(line 216):
>               /* Enqueue the descriptor.  */
>               do
>                 pd->nextevent = __nptl_last_event;
>               while (atomic_compare_and_exchange_bool_acq(&__nptl_last_event, pd, pd->nextevent) != 0);
> 
> 
> And here is what could have happened:
> a) do_clone() creates the child process.
> b) the child process gets a new stack
> c) the child calls atomic_compare_and_exchange_bool_acq() and thus the LWS code above.
> d) the LWS code writes to the stack location at -1b8(sp), which is out of bounds for the child process (the child stack got only ~ 0x40 bytes initial room)

I think the stack locations should be ok because start_thread allocates
an additional 0x1c0 bytes:

Dump of assembler code for function start_thread:
   0x40a40300 <+0>:     stw rp,-14(sp)
   0x40a40304 <+4>:     ldo 1c0(sp),sp

In all the fails I have looked at, the saved $rp value is clobbered.
The stack pointer value seems consistent with 0x40 + 0x1c0.  The data
placed at the beginning of the stack for the child thread is not clobbered.

> e) Thus the child either crashes, overwrites memory of the parent or does other things wrong.

I don't see how the forked child can affect the memory of the parent.
It can close files and affect the parent that way (child should use
_exit and not exit).

If the forked child actually overwrites memory of the parent, this is
a big bug in the linux fork code.

> Additionally:
> Due to the LWS assembly code and because we don't have many registers free while using LWS, gcc used %rp as a temporary register which may have fooled us in our thinking?

$rp is saved in the first instruction of start_thread.  So, its use
below should be ok.

> 0x40705458 <start_thread+1144>: ldi 0,rp
> 0x4070545c <start_thread+1148>: ldi fb,r3
> 0x40705460 <start_thread+1152>: ldw -70(sp),ret0
> 0x40705464 <start_thread+1156>: ldw 214(ret0),ret1
> 0x40705468 <start_thread+1160>: copy r5,r26
> 0x4070546c <start_thread+1164>: copy ret1,r25
> 0x40705470 <start_thread+1168>: copy rp,r24
> 0x40705474 <start_thread+1172>: be,l b0(sr2,r0),sr0,r31
> 0x40705478 <start_thread+1176>: ldi 0,r20
> 0x4070547c <start_thread+1180>: ldi -b,r24
> 0x40705480 <start_thread+1184>: cmpb,=,n r24,r21,0x40705468 <start_thread+1160>
> 0x40705484 <start_thread+1188>: nop
> 0x40705488 <start_thread+1192>: ldi -2d,r25
> 0x4070548c <start_thread+1196>: cmpb,=,n r25,r21,0x40705468 <start_thread+1160>
> 0x40705490 <start_thread+1200>: nop
> 0x40705494 <start_thread+1204>: stw ret0,-1b8(sp)
> 0x40705498 <start_thread+1208>: sub r0,r21,r21
> 0x4070549c <start_thread+1212>: stw r21,-1b4(sp)
> 0x407054a0 <start_thread+1216>: ldw -1b4(sp),ret0
> 
> 
> If my assumptions are correct, then we either could
> 
> a) use the gcc atomic builtins instead of own atomic code in libc6:
> E.g: add to ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h:
> ...
> #if __GNUC_PREREQ (4, 1)
> # define atomic_compare_and_exchange_val_acq(mem, newval, oldval) \
>   __sync_val_compare_and_swap (mem, oldval, newval)
> #  define atomic_compare_and_exchange_bool_acq(mem, newval, oldval) \
>   (! __sync_bool_compare_and_swap (mem, oldval, newval))
> 
> #elif __ASSUME_LWS_CAS
> ....

There may be a bug in the gcc atomic builtins.  We shanged recently
to using the sync builtins in libstdc++.  Then, two fails appeared
recently that I haven't had time to look at:

WARNING: program timed out.
FAIL: 29_atomics/atomic_flag/clear/1.c execution test
FAIL: 29_atomics/atomic_flag/test_and_set/explicit.c execution test

That said, this is an interesting test.  Does it fix minifail?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
