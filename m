From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Tue, 22 Dec 2009 10:52:57 -0500
Message-ID: <119aab440912220752vf8ea2c1o22d316735b3ddcf6@mail.gmail.com>
References: <20091222150352.120CB516F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091222150352.120CB516F@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 22, 2009 at 10:03 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> I recently update gsyprf11 to the latest debian testing. =A0I also
> tried 2.6.32.2, first SMP, then UP because of /bin/sh segmentation
> faults.
>
> I think the /bin/sh segmentation faults are the vfork issue, but
> the vfork testcases run successfully on the above.

That's a shame, the testcase was pretty straight forward. I will try
to update the test case when I have my new kernel running.

> My first attempt at running the GCC testsuite hung:
> dave@gsyprf11:~/gcc-4.5/objdir$ strace -p 18073
> Process 18073 attached - interrupt to quit
> futex(0x1c538, FUTEX_WAIT_PRIVATE, 2, NULL <unfinished ...>
> Process 18073 detached
> dave@gsyprf11:~/gcc-4.5/objdir$ strace -p 18091
> attach: ptrace(PTRACE_ATTACH, ...): Operation not permitted
>
> This is the backtrace for expect:
>
> 0x4039934c in __lll_lock_wait () from /lib/libpthread.so.0
> (gdb) bt
> #0 =A00x4039934c in __lll_lock_wait () from /lib/libpthread.so.0
> #1 =A00x4038f9c4 in pthread_mutex_lock () from /lib/libpthread.so.0
> #2 =A00x40b73008 in pthread_mutex_lock () from /lib/libc.so.6
> #3 =A00x4085eeb8 in Tcl_WaitForEvent () from /usr/lib/libtcl8.5.so.0
> #4 =A00x4081ccdc in Tcl_DoOneEvent () from /usr/lib/libtcl8.5.so.0
> #5 =A00x4003d9c4 in exp_get_next_event () from /usr/lib/libexpect.so.=
5.44.1.14
> #6 =A00x4001c6bc in expRead () from /usr/lib/libexpect.so.5.44.1.14
> #7 =A00x4001eea0 in Exp_ExpectObjCmd () from /usr/lib/libexpect.so.5.=
44.1.14
> ...
>
> This is just a guess but I would guess that the gfortran task either
> didn't update the futex address, or is blocked from doing so.
>
> libc6 is 2.10.2-2.
>
> This is probably related to the long standing problem with expect
> and tcl8.4 and later. =A0expect-tcl8.3 works better.
>
> Any thoughts?

You should be looking for the thread (not process) that is supposed to
wake this thread up. It's a private futex, meaning it isn't going to
be shared with any other process. If it is shared, and the wakeup (or
pthread_mutex_unlock) is issued from another thread in another process
then it won't be seen by the thread in this process.

We might have an hppa specific glibc bug related to the futex private f=
lag.

The hppa lowlevellock.h is a copy of the generic version. Perhaps I
need to update our copy to get recent bug fixes from other targets.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
