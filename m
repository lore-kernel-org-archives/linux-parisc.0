From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 15:36:05 -0500
Message-ID: <119aab440912231236i21d932a8x78a991eb019610f2@mail.gmail.com>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com>
	 <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca>
	 <119aab440912230701g6656be6fsdaf5383d2ff02363@mail.gmail.com>
	 <20091223161504.GA13299@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091223161504.GA13299@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 23, 2009 at 11:15 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> There will never be a timeout if you call pthread_mutex_lock as the
>> underlying operation. So this comment is a bit odd?
>
> The wait is done by Tcl_ConditionWait. =A0It uses =A0pthread_cond_wai=
t
> if timePtr is NULL, otherwise it uses
> pthread_cond_timedwait(pcondPtr, pmutexPtr, &ptime). =A0Do these work
> holding a lock? =A0Any chance that these try to take a lock?

When you call pthread_cond_timedwait you must be holding pmutexPtr.

The call to pthread_cond_timedwait atomically release mutex and cause
the calling thread to sleep on the condition variable cond; atomically
here means "atomically with respect to access by another thread to
the mutex and then the condition variable". Once awoken by a broadcast,
it retakes the mutex pmutexPtr.

The glibc implementation with futexes reads pretty much exactly like
the description here:
http://www.opengroup.org/onlinepubs/000095399/functions/pthread_cond_ti=
medwait.html

> It sems like bad coding to do a wait holding a lock. =A0In any case,
> I don't think this is the problem.

You shouldn't be holding a lock while waiting. The call to
pthread_cond_timedwait
should have released the mutex before sleeping.

> As you noted, the lock is held by the other thread. =A0The return pc =
is
> beyond Tcl_WaitForEvent. =A0The only users of the notifierMutex mutex
> are in tclUnixNotfy.c. =A0The only interesting thing done holding the
> notifierMutex mutex in code after Tcl_WaitForEvent is to call
> Tcl_ConditionNotify. =A0It calls pthread_cond_broadcast if the condit=
ion
> pointer isn't NULL.
> Could this deadlock? =A0It's hard to see how it could since the mutex
> doesn't seem to be involved.

It shouldn't deadlock.

Is this a UP kernel?

Perhaps what I'm not clear about here, is which mutex is the one that
we are stuck on?

Are we stuck on the mutex we want to pass to pthread_cond_timedwait?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
