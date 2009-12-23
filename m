From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 10:01:32 -0500
Message-ID: <119aab440912230701g6656be6fsdaf5383d2ff02363@mail.gmail.com>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com>
	 <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 22, 2009 at 5:05 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> I think we need to step back from the edge and ask ourselves what
>> Tcl_WaitForEvent() is trying to do with the locks.
>>
>> Do you know?
>
> In unix/tclUnixNotify.c:
>
> #ifdef TCL_THREADS
> =A0 =A0/*
> =A0 =A0 * Place this thread on the list of interested threads, signal=
 the
> =A0 =A0 * notifier thread, and wait for a response or a timeout.
> =A0 =A0 */

There will never be a timeout if you call pthread_mutex_lock as the
underlying operation. So this comment is a bit odd?

> =A0 =A0Tcl_MutexLock(&notifierMutex);
> =A0 =A0...
> #endif
>
> =A0 =A0...
>
> #ifdef TCL_THREADS
> =A0 =A0Tcl_MutexUnlock(&notifierMutex);
> #endif /* TCL_THREADS */
> =A0 =A0return 0;
> }
>
> There may be a timed wait while holding the lock. =A0Something is bro=
ken
> in the tcl/expect handling of timed waits as there were a couple of
> compile timeouts for compilations that shouldn't have timed out.

There is no timed wait possible, you have called pthread_mutex_lock,
instead of pthread_mutex_timedlock.

What are Tcl's expectations here? It looks like we are stuck in
libtcl.so for both threads, which are trying to access this event
queue.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
