Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8737F4841
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 11:53:55 -0600 (MDT)
Date: Fri, 19 Sep 2003 13:51:42 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] r19 (aka pic-register akak ltp) not restored on entry back to libc from libpthread?
Message-ID: <20030919175142.GI18225@systemhalted>
References: <20030919135606.GE18225@systemhalted> <200309191656.h8JGukWJ003212@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309191656.h8JGukWJ003212@hiauly1.hia.nrc.ca>
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

On Fri, Sep 19, 2003 at 12:56:46PM -0400, John David Anglin wrote:
> > Hold your horses here, we made it back into libc but our ltp is still
> > that which we loaded upon entry to libpthread? :(
> 
> That's ok.  It's the responsibility of the libc code to restore ltp
> after a call or exception.  However, as discussed previously, there
> is no restoration after a syscall.  That should be the system's job,
> although I believe you were going to introduce a hack/workaround to
> fix the syscalls that clobber r19.

For all syscalls whose wrappers are pure assembly or __asm(...) I have
placed restorations to follow ABI. This fixed all of the major failures.
It's a bit drastic, but it fixes the issue until I know exactly which
syscall numbers clobber r19. It looks like just fork and it's variants
that stick a return address into PT_REGS's r19. That's a side issue
about optimization though. 

> You need to step through the libc code from the return point in
> libc to see why ltp isn't being restored.  Possibly, libpthread is
> being called by assembly code that doesn't restore ltp.  Normally,
> r19 is restored quite soon after a call.

There should be no assembly code glue between the calls.
What about the gcc optimization where we don't restore r19 if it's not
used between the last call and the return?

mutex_unlock becomes:
__libc_maybe_call (__pthread_mutex_unlock, (m), (*(int *)(m) = 0))

Which is a big monstrosity that looks like it might be casting things
incorrectly for hppa...

===
#if defined _LIBC && defined IS_IN_libpthread
# define __libc_maybe_call(FUNC, ARGS, ELSE) FUNC ARGS
#else
# if defined __PIC__ || (defined _LIBC && defined SHARED)
#  define __libc_maybe_call(FUNC, ARGS, ELSE) \
  (__extension__ ({ __typeof (FUNC) *_fn = (FUNC); \
                    _fn != NULL ? (*_fn) ARGS : ELSE; }))
# else
#  define __libc_maybe_call(FUNC, ARGS, ELSE) \
  (FUNC != NULL ? FUNC ARGS : ELSE)
# endif
#endif
#if defined _LIBC && !defined NOT_IN_libc && defined SHARED
# define __libc_maybe_call2(FUNC, ARGS, ELSE) \
  ({__builtin_expect (__libc_pthread_functions.ptr_##FUNC != NULL, 0) \
    ? __libc_pthread_functions.ptr_##FUNC ARGS : ELSE; })
#else
# define __libc_maybe_call2(FUNC, ARGS, ELSE) __libc_maybe_call
# (__##FUNC, ARGS, ELSE)
#endif
===

I have class, then I'll be back to -E some of the malloc build to see
what this evaluates to and then try to determine if gcc did the right
thing.

c.
