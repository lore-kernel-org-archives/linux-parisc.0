From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 09:56:24 -0500
Message-ID: <119aab440912230656h73081d97wadf1e58a4a598338@mail.gmail.com>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com>
	 <20091222212950.8E5F74EA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091222212950.8E5F74EA9@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 22, 2009 at 4:29 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> It would seem to me we have deadlock. =A0Two threads trying to lock
> the same mutex. =A0One should win... =A0It may be the mutex was left
> locked by some other thread.

Yes, it was left locked by thread #2, which then tried to acquire it
again. See below.

> This is the mutex:
>
> (gdb) p *mutex
> $1 =3D {__data =3D {__lock =3D 2, __count =3D 0, __owner =3D 18093, _=
_kind =3D 0,
> =A0 =A0__compat_padding =3D {0, 0, 0, 0}, __nusers =3D 1, {__spins =3D=
 0, __list =3D {
> =A0 =A0__next =3D 0x0}}, __reserved1 =3D 0, __reserved2 =3D 0},
> =A0 =A0__size =3D "\000\000\000\002\000\000\000\000\000\000F\255", '\=
000' <repeats 23 times>, "\001", '\000' <repeats 11 times>, __align =3D=
 2}

The __nusers field indicates that one user, namely __owner tid 18093
has already taken the lock.

The mutex owner is thread #2 in your example (tid shown in your backtra=
ce).

Thread #2 is also trying to lock the mutex again and is deadlocked.

The mutex is the default __kind of PTHREAD_MUTEX_TIMED_NP, but that
doesn't mean it's timed, only that it supports a timed lock, if you
call it using pthread_mutex_lock it will lock just like any other
mutex.

The lock value is 2, which indicates a private lock. Your backtrace
indicates you have called __lll_lock_wait_private, which is correct
for this case.

Under what conditions would thread #2 have a chance to try take it's
own lock again?

> It's hard to see what's happening because I don't seem to be able to
> single step the threads.

Yeah, there are some gdb/ptrace issues I need to sort out for the
newly minted nptl support.

>>
>> I think we need to step back from the edge and ask ourselves what
>> Tcl_WaitForEvent() is trying to do with the locks.
>>
>> Do you know?
>
> No. =A0Note thread 2 called pthread_mutex_lock from a different locat=
ion.

We need to determine under what conditions thread #2 would be able to
take the lock again and deadlock.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
