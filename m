From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Mon, 4 Jul 2011 11:21:52 -0400
Message-ID: <CADZpyiwjD2kMPoh9rm1KL_+mYm72nPz8ERHcSuHODkD31qncuQ@mail.gmail.com>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>
	<BLU0-SMTP9158F203DF2B6A1AD1D9A4975D0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP9158F203DF2B6A1AD1D9A4975D0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jul 3, 2011 at 7:22 PM, John David Anglin <dave.anglin@bell.net=
> wrote:
> Hi Carlos,
>
> From what I see below, you have learned a lot about the failure. =A0T=
here's
> probably an operation
> in the kernel that isn't hooked up although one would tend to think m=
ost of
> this should be generic.

OK, fixed the kernel. We were still using the no-op futex
implementation I checked in 5 years ago :-(

=46ixing the kernel doesn't fix the testcase but instrumenting glibc
further reveals the cause of the failure:
~~~
carlos@firin:~/fsrc/glibc-work/tests/tst-cputimer1$ ./tst-cputimer1
do_clone: ARCH_CLONE...

clock_gettime returned timespec =3D { 0, 40000000 }
clock_getres returned timespec =3D { 0, 1 }
do_clone: ARCH_CLONE...

timer_helper_thread: creating thread...

do_clone: ARCH_CLONE...

timer_helper_thread: pthread_create ret 0
timer_segev_thread: tid 20077
timer_helper_thread: creating thread...

pthread_create: ALLOCATE_STACK failed.

timer_helper_thread: pthread_create ret 22
~~~

The second threads stack fails to allocate.

I don't know why, the stack allocation on hppa is tricky because of
S_G_U and the placement of stack guards.

Why it would fail for one thread and not the other is odd.

I'll keep digging.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
