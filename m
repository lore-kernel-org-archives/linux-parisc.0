From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Tue, 5 Jul 2011 13:28:35 -0400
Message-ID: <CADZpyiyZjaW3HnXJdvVCS+5SSbLmYtXXne6gkWu0KzcmASFUQg@mail.gmail.com>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>
	<BLU0-SMTP9158F203DF2B6A1AD1D9A4975D0@phx.gbl>
	<CADZpyiwjD2kMPoh9rm1KL_+mYm72nPz8ERHcSuHODkD31qncuQ@mail.gmail.com>
	<CADZpyiwDx-6oHNaCXoVC_XWpeUuZ3_n5RLzdmZK0Aoeh0ra3tw@mail.gmail.com>
	<BLU0-SMTP765C4C4388C64F0F8BF8F8975C0@phx.gbl>
	<CADZpyiyWCa0o2Rpj_PoJLoT28G_SuV4P896Y-+Y3rWQXqmQWTQ@mail.gmail.com>
	<BLU0-SMTP5FDE70B357D278016D47B975C0@phx.gbl>
	<CADZpyiwkPxzakrm+8rwOOjRnfXWPowsxZfQhDU1cr_ZSBNNhWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiwkPxzakrm+8rwOOjRnfXWPowsxZfQhDU1cr_ZSBNNhWQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 4, 2011 at 2:59 PM, Carlos O'Donell <carlos@systemhalted.org> wrote:
> On Mon, Jul 4, 2011 at 2:50 PM, John David Anglin <dave.anglin@bell.net> wrote:
>> The Linux man page says the mprotect addr must be a valid pointer or a
>> multiple of PAGESIZE.
>> It's not clear what the mprotect call is trying to protect but it is
>> definitely not page aligned.
>
> It's trying to protect the new stack for the thread, which is
> obviously in the wrong spot.

Good news.

I have fixed tst-cputimer1.

When a thread uses a cached stack block the location of the guard is
incorrectly computed.

The incorrect guard location causes mprotect to fail, failing the
thread stack allocation, and triggering a thread creation failure.

The defect results:

* in a missed timer event because of the silent death of the timer
thread (SIGEV_THREAD) that used the cached stack.

* in a pthread_create failure with error code EINVAL (22).

With the fix I can now run tst-cputimer1 without a hang, but the test
still complains about timers expiring early, that may be kernel
related.

This is a *serious* defect and would have caused a lot of userspace
instability for any program that uses short running threads (causing
the stack cache to be used).

I'm surprised that things worked so well, it's probably a testament to
the fact that few programs use SIGEV_THREAD, threads, or short running
threads.

When debugging if you slow down thr1 sufficiently, then thr2 can't
reuse the stack and it gets a new one, which works correctly. This
explains the odd behaviour I saw during debugging.

In a similar vein, I found that madvise was being passed an unaligned
block during thread shutdown, resulting in memory not being correctly
given back to the OS.

These two bug fixes should be a serious win for threaded applications on hppa.

~~~ tst-cputimer1 run on patched glibc ~~~
carlos@firin:~/fsrc/glibc-work/tests/tst-cputimer1$ ./tst-cputimer1 >& run.txt
carlos@firin:~/fsrc/glibc-work/tests/tst-cputimer1$ cat run.txt
clock_gettime returned timespec = { 0, 36000000 }
clock_getres returned timespec = { 0, 1 }
*** Calling clock_gettime

*** Checking thr2_cont > =5

*** Incrementing thr2_count

*** timer sig1 invoked too soon: 0.436000000 instead of expected 0.440000000
*** timer sig2 invoked too soon: 0.536000000 instead of expected 0.540000000
*** Calling clock_gettime

*** Checking thr2_cont > =5

*** Incrementing thr2_count

*** Calling clock_gettime

*** Checking thr2_cont > =5

*** Incrementing thr2_count

*** Calling clock_gettime

*** Checking thr2_cont > =5

*** Incrementing thr2_count

*** Calling clock_gettime

*** Checking thr2_cont > =5

*** Incrementing thr2_count

*** Calling clock_gettime

*** Checking thr2_cont > =5

*** Incrementing thr2_count

*** timer thr2 invoked too soon: 2.928000000 instead of expected 2.936000000
*** timer sig1 invoked too soon: 3.424000000 instead of expected 3.436000000
*** timer sig2 invoked too soon: 3.924000000 instead of expected 3.936000000
carlos@firin:~/fsrc/glibc-work/tests/tst-cputimer1$
~~~

Cheers,
Carlos.
