From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Mon, 4 Jan 2010 12:16:40 -0500
Message-ID: <119aab441001040916v4ed3fb61od24cfcc6e3558faa@mail.gmail.com>
References: <20100101034858.80D264EA9@hiauly1.hia.nrc.ca>
	 <20100104162732.10090@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org, dave.anglin@nrc-cnrc.gc.ca
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100104162732.10090@gmx.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jan 4, 2010 at 11:27 AM, Helge Deller <deller@gmx.de> wrote:
> I think I have an idea what could have happened and why it most of th=
e times (but not always) crashes in the child process...
>
> In ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h we have:
> #define atomic_compare_and_exchange_val_acq(mem, newval, oldval) \
> =A0({ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
\
> =A0 =A0 volatile int lws_errno; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 volatile int lws_ret; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 asm volatile( =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ...some assembly...
> =A0 =A0 =A0 =A0"stw =A0 =A0%%r28, %0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 \n\t" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0"sub =A0 =A0%%r0, %%r21, %%r21 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0\n\t" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0"stw =A0 =A0%%r21, %1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 \n\t" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0: "=3Dm" (lws_ret), "=3Dm" (lws_errno) =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0: "r" (mem), "r" (oldval), "r" (newval) =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0: _LWS_CLOBBER
>
> this means, that lws_errno and lws_ret are located on the stack.

Correct. We could place them in registers if we wanted, they are
registers r28 (lws return) and r21 (lws error).

> With gdb I see this expanded to:
> 0x40705494 <start_thread+1204>: stw ret0,-1b8(sp)
> 0x40705498 <start_thread+1208>: sub r0,r21,r21
> 0x4070549c <start_thread+1212>: stw r21,-1b4(sp)
>
> So, lws_ret/lws_errno are at -1b8/-1b4(sp).

Correct.

> And this LWS code is called from
> ../nptl/sysdeps/pthread/createthread.c:
> static int create_thread (struct pthread *pd, const struct pthread_at=
tr *attr, STACK_VARIABLES_PARMS)
> ...
> =A0 =A0 =A0 =A0 =A0int res =3D do_clone (pd, attr, clone_flags, start=
_thread,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0STACK_VARI=
ABLES_ARGS, 1);
> =A0 =A0 =A0 =A0 =A0if (res =3D=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0{
> ...(line 216):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Enqueue the descriptor. =A0*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0do
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pd->nextevent =3D __nptl_last_event;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0while (atomic_compare_and_exchange_bool_ac=
q(&__nptl_last_event, pd, pd->nextevent) !=3D 0);
>
>
> And here is what could have happened:
> a) do_clone() creates the child process.
> b) the child process gets a new stack
> c) the child calls atomic_compare_and_exchange_bool_acq() and thus th=
e LWS code above.
> d) the LWS code writes to the stack location at -1b8(sp), which is ou=
t of bounds for the child process (the child stack got only ~ 0x40 byte=
s initial room)

This is wrong. Each thread should have 8MB of stack. If we only get ~
0x40 bytes then npt/nptl-init.c is setting __default_stacksize
incorrectly.

Even PTHREAD_STACK_MIN should be 16kb?

Could you verify that your assertion that only ~ 0x40 bytes of initial
room were allocated?

> e) Thus the child either crashes, overwrites memory of the parent or =
does other things wrong.

I agree with your analysis, but the error is that more stack should be
allocated.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
